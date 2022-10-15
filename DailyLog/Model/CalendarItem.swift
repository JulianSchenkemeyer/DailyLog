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

///
struct CalendarItem {
    let date: Date
    let dayInt: Int
    let day: Weekday

    var isFromPreviousMonth: Bool {
        date.monthInt < Date().monthInt
    }

    var isToday: Bool {
        date.dayInt == Date().dayInt && !isFromPreviousMonth
    }

    init(date: Date) {
        self.date = date
        dayInt = date.dayInt
        day = Weekday(rawValue: date.weekday.lowercased())!
    }
}
