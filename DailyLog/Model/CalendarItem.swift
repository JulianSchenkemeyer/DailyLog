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

struct CalendarItem: Identifiable {
	let id = UUID()

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

	init(date: Date, cdData: Day? = nil) {
        self.date = date
        dayInt = date.dayInt
        day = Weekday(rawValue: date.weekday.lowercased())!
		data = cdData
    }
}
