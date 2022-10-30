//
//  CalendarItem.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 08.10.22.
//

import Foundation

enum Weekday: String, CaseIterable, Identifiable {
    var id: RawValue { rawValue }

    case mon, tue, wed, thu, fri, sat, sun
}

struct CalendarItem: Identifiable, Hashable {
	static var counter = 0
	let id: Int

    let date: Date
    let dayInt: Int
    let day: Weekday
	let data: Day?

    var isFromPreviousMonth: Bool {
        date.monthInt < Date().monthInt
    }

    var isToday: Bool {
        date.dayInt == Date().dayInt && !isFromPreviousMonth
    }

	var getLogCount: Int {
		guard let data = self.data, let logs = data.logs else { return 0 }
		return logs.count
	}

	static func generateId() -> Int {
		counter += 1
		return counter
	}

	init(date: Date, cdData: Day? = nil) {
		id = CalendarItem.generateId()

        self.date = date
        dayInt = date.dayInt
        day = Weekday(rawValue: date.weekday.lowercased())!
		data = cdData
    }
}
