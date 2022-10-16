//
//  CalendarItemTests.swift
//  DailyLogTests
//
//  Created by Julian Schenkemeyer on 16.10.22.
//

import XCTest

final class CalendarItemTests: XCTestCase {
	let dateFormatter = DateFormatter()

	override func setUpWithError() throws {
		dateFormatter.dateFormat = "yyyy-MM-dd"
	}

	func testInit() {
		let pastDate = dateFormatter.date(from: "2020-08-05")!
		let today = Date()

		let todayCalendarItem = CalendarItem(date: today)
		let pastCalendarItem = CalendarItem(date: pastDate)

		XCTAssertEqual(todayCalendarItem.date, today)
		XCTAssertEqual(todayCalendarItem.dayInt, today.dayInt)

		let weekdayOfToday = Weekday(rawValue: today.weekday.lowercased())!
		XCTAssertEqual(todayCalendarItem.day, weekdayOfToday)

		XCTAssertEqual(pastCalendarItem.date, pastDate)
		XCTAssertEqual(pastCalendarItem.dayInt, pastDate.dayInt)

		let weekdayOfPast = Weekday(rawValue: pastDate.weekday.lowercased())!
		XCTAssertEqual(pastCalendarItem.day, weekdayOfPast)
	}

	func testIsTodayProperty() {
		let pastDate = dateFormatter.date(from: "2020-08-05")!
		let today = Date()

		let todayCalendarItem = CalendarItem(date: today)
		let pastCalendarItem = CalendarItem(date: pastDate)

		XCTAssertTrue(todayCalendarItem.isToday)
		XCTAssertFalse(pastCalendarItem.isToday)
	}

	func testIsFormPreviousMonthProperty() {
		let pastDate = dateFormatter.date(from: "2020-08-05")!
		let today = Date()

		let todayCalendarItem = CalendarItem(date: today)
		let pastCalendarItem = CalendarItem(date: pastDate)

		XCTAssertFalse(todayCalendarItem.isFromPreviousMonth)
		XCTAssertTrue(pastCalendarItem.isFromPreviousMonth)
	}
}
