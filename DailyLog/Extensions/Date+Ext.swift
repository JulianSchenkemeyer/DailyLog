//
//  Date+Ext.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 08.10.22.
//

import Foundation

extension Date {
    /// Returns the first date value of the month
    var startOfMonth: Date {
        Calendar.current.dateInterval(of: .month, for: self)!.start
    }

    /// Returns the end value of the month
    var endOfMonth: Date {
        Calendar.current.dateInterval(of: .month, for: self)!.end
    }

	var startOfDay: Date {
		Calendar.current.startOfDay(for: self)
	}

    var endOfDay: Date {
        Calendar.current.dateInterval(of: .day, for: self)!.end
    }

    var startOfPreviousMonth: Date {
        let dayInPreviousMonth = Calendar.current.date(byAdding: .month, value: -1, to: self)!
        return dayInPreviousMonth.startOfMonth
    }

    var startOfNextMonth: Date {
        let dayInNextMonth = Calendar.current.date(byAdding: .month, value: 1, to: self)!
        return dayInNextMonth.startOfMonth
    }

    var numberOfDaysInMonth: Int {
        // endOfMonth returns the 1st of next month at midnight.
        // An adjustment of -1 is necessary to get last day of current month
        let endDateAdjustment = Calendar.current.date(byAdding: .day, value: -1, to: endOfMonth)!
        return Calendar.current.component(.day, from: endDateAdjustment)
    }

    var weekday: String {
        formatted(.dateTime.weekday(.abbreviated).locale(Locale(identifier: "en-US")))
    }

    var dayInt: Int {
        Calendar.current.component(.day, from: self)
    }

    var monthInt: Int {
        Calendar.current.component(.month, from: self)
    }

    var monthFullName: String {
        formatted(.dateTime.month(.wide).locale(Locale(identifier: "en-US")))
    }

    var startOfCalendarWithPrefixDays: Date {
        let startOfMonthWeekDay = Calendar.current.component(.weekday, from: startOfMonth)
        let numberOfPrefixDays = startOfMonthWeekDay - 2
        let startDate = Calendar.current.date(byAdding: .day, value: -numberOfPrefixDays, to: startOfMonth)!

        return startDate
    }
}
