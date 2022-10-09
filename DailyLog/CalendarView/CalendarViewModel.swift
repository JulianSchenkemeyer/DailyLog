//
//  CalendarViewModel.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 09.10.22.
//

import Foundation


final class CalendarViewModel: ObservableObject {
	let startDateWithPrefix: Date
	let endDate: Date
	
	@Published var calendarItems: [CalendarItem] = []
	
	init() {
		let today = Date()
		
		self.startDateWithPrefix = today.startOfCalendarWithPrefixDays
		self.endDate = today.endOfMonth
		
		self.calendarItems = createCalendarItemsForDisplayedMonth(start: startDateWithPrefix, end: endDate)
	}
	
	func createCalendarItemsForDisplayedMonth(start: Date, end: Date) -> [CalendarItem] {
		var calendarItems: [CalendarItem] = []
		
		var i = start
		while i < end {
			let newCalendarItem = CalendarItem(date: i)
			calendarItems.append(newCalendarItem)
			i = Calendar.current.date(byAdding: .day, value: 1, to: i)!
		}
		
		return calendarItems
	}
}
