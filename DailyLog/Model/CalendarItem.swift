//
//  CalendarItem.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 08.10.22.
//

import Foundation

enum Weekday: String, CaseIterable, Identifiable {
	var id: RawValue { rawValue }
	
	case Mon, Tue, Wed, Thu, Fri, Sat, Sun
}


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
		self.dayInt = date.dayInt
		self.day = Weekday(rawValue: date.weekday)!
	}
}

