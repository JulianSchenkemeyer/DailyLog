//
//  AddLogEntryViewModel.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 09.11.22.
//

import Foundation
import CoreData

final class AddLogEntryViewModel: ObservableObject {
	let viewContext = PersistenceController.shared.container.viewContext

	@Published var rating = "😀"
	@Published var note = ""

//	private var coreDataRequest: NSFetchRequest<Day> {
//		let request = Day.fetchRequest()
//		request.sortDescriptors = [NSSortDescriptor(keyPath: \Day.date, ascending: true)]
//		request.predicate = NSPredicate(format: "(date >= %@) AND (date <= %@)",
//										startDateWithPrefix as CVarArg,
//										endDate as CVarArg)
//		return request
//	}
//
//	private func getCoreDataEntriesForDisplayedItems() -> [Day] {
//		let days = (try? viewContext.fetch(coreDataRequest)) ?? []
//
//		return days
//	}

	private var currentDayRequest: NSFetchRequest<Day> {
		let today = Date.now
		let startOfToday = today.startOfDay
		let endOfToday = today.endOfDay
		let request = Day.fetchRequest()
		request.predicate = NSPredicate(format: "(date >= %@) AND date <= %@",
										startOfToday as CVarArg,
										endOfToday as CVarArg)
		return request
	}

	private func getCurrentDayEntry() -> Day? {
		let days = (try? viewContext.fetch(currentDayRequest)) ?? []
		guard !days.isEmpty else { return nil }
		return days[0]
	}

	func saveLogEntry() {
		let newLog = Log(context: viewContext)
		newLog.rating = rating
		newLog.note = note

		let day = getCurrentDayEntry()
		if let day {
			newLog.day = day
		} else {
			// There is no day entry for today yet, so we need to create it first
			let newDay = Day(context: viewContext)
			newDay.date = Date.now
			newLog.day = newDay
		}

		do {
			try viewContext.save()
		} catch {
			print("❌ Unable to save the viewcontext")
		}
	}
}
