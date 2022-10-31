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
	let id: String

    let date: Date
    let dayInt: Int
    let day: Weekday
	let logs: [Log]

    var isFromPreviousMonth: Bool {
        date.monthInt < Date().monthInt
    }

    var isToday: Bool {
        date.dayInt == Date().dayInt && !isFromPreviousMonth
    }

	var getLogCount: Int {
		return logs.count
	}

	init(date: Date, cdData: Day? = nil) {
		id = date.formatted(.dateTime.year().month(.twoDigits).day(.twoDigits))

        self.date = date
        dayInt = date.dayInt
        day = Weekday(rawValue: date.weekday.lowercased())!

		if let logsSet = cdData?.logs, let logsArray = logsSet.allObjects as? [Log] {
			self.logs = logsArray
		} else {
			self.logs = []
		}
    }
}
