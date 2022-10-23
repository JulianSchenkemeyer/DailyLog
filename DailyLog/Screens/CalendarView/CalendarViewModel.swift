//
//  CalendarViewModel.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 09.10.22.
//

import CoreData
import Foundation

final class CalendarViewModel: ObservableObject {
	let startDateWithPrefix: Date
	let endDate: Date

	@Published var calendarItems: [CalendarItem] = []

	init() {
		let today = Date()
		startDateWithPrefix = today.startOfCalendarWithPrefixDays
		endDate = today.endOfMonth

		// Initialise data
		let days = getCoreDataEntriesForDisplayedItems()
		calendarItems = createCalendarItemsForDisplayedMonth(start: startDateWithPrefix, end: endDate, cdData: days)
	}

	func createCalendarItemsForDisplayedMonth(start: Date, end: Date, cdData: [Day]) -> [CalendarItem] {
		var calendarItems: [CalendarItem] = []

		var cdDataIterator = 0
		var calendarIterator = start
		while calendarIterator < end {
			guard cdData.count > cdDataIterator else {
				let newCalendarItem = CalendarItem(date: calendarIterator)
				calendarItems.append(newCalendarItem)
				calendarIterator = Calendar.current.date(byAdding: .day, value: 1, to: calendarIterator)!
				continue
			}

			var data: Day?
			if let cdDataDate = cdData[cdDataIterator].date, cdDataDate.dayInt == calendarIterator.dayInt {
				data = cdData[cdDataIterator]
				cdDataIterator += 1
			}

			let newCalendarItem = CalendarItem(date: calendarIterator, cdData: data)
			calendarItems.append(newCalendarItem)
			calendarIterator = Calendar.current.date(byAdding: .day, value: 1, to: calendarIterator)!
		}

		return calendarItems
	}

	var coreDataRequest: NSFetchRequest<Day> {
		let request = Day.fetchRequest()
		request.sortDescriptors = [NSSortDescriptor(keyPath: \Day.date, ascending: true)]
		request.predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)",
		                                startDateWithPrefix as CVarArg,
		                                endDate as CVarArg)
		return request
	}

	func getCoreDataEntriesForDisplayedItems() -> [Day] {
		let viewContext = PersistenceController.shared.container.viewContext
		let days = (try? viewContext.fetch(coreDataRequest)) ?? []

		return days
	}
}
