//
//  DailyLogTests.swift
//  DailyLogTests
//
//  Created by Julian Schenkemeyer on 10.10.22.
//

import XCTest

final class DateExtensionTests: XCTestCase {
	
	let dateFormatter = DateFormatter()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testStartOfMonth() throws {
		let expected = dateFormatter.date(from: "2022-04-01T00:00:00")
		
		
		let date = dateFormatter.date(from: "2022-04-16T12:00:00")
		XCTAssertFalse(date == expected)
		
		let startOfMonth = date?.startOfMonth
		XCTAssertEqual(startOfMonth, expected)
	}
	
	func testEndOfMonth() throws {
		let expected = dateFormatter.date(from: "2022-05-01T00:00:00")
		
		
		let date = dateFormatter.date(from: "2022-04-16T12:00:00")
		XCTAssertFalse(date == expected)
		
		let endOfMonth = date?.endOfMonth
		XCTAssertEqual(endOfMonth, expected)
	}

	func testEndOfDay() throws {
		let expected = dateFormatter.date(from: "2022-05-02T00:00:00")
		
		
		let date = dateFormatter.date(from: "2022-05-01T12:59:40")
		XCTAssertFalse(date == expected)
		
		let endOfDay = date?.endOfDay
		XCTAssertEqual(endOfDay, expected)
	}
	
	func testStartOfPreviousMonth() throws {
		let expected = dateFormatter.date(from: "2022-03-01T00:00:00")
		
		
		let date = dateFormatter.date(from: "2022-04-16T12:00:00")
		XCTAssertFalse(date == expected)
		
		let startOfPreviousMonth = date?.startOfPreviousMonth
		XCTAssertEqual(startOfPreviousMonth, expected)
	}
	
	func testStartOfNextMonth() throws {
		let expected = dateFormatter.date(from: "2022-05-01T00:00:00")
		
		
		let date = dateFormatter.date(from: "2022-04-16T12:00:00")
		XCTAssertFalse(date == expected)
		
		let startOfNextMonth = date?.startOfNextMonth
		XCTAssertEqual(startOfNextMonth, expected)
	}
	
	func testNumberOfDaysInMonth() throws {
		let expected = 28
		
		let date = dateFormatter.date(from: "2022-02-14T13:46:13")
		let days = date?.numberOfDaysInMonth
		XCTAssertEqual(days, expected)
	}
	
	func testWeekday() throws {
		let expected = "Sat"
		
		let date = dateFormatter.date(from: "2022-10-15T00:00:00")
		let weekday = date?.weekday
		
		XCTAssertEqual(weekday!, expected)
	}
	
	func testDayInt() throws {
		let expected = 15
		
		let date = dateFormatter.date(from: "2022-10-15T00:00:00")
		let dayInt = date?.dayInt
		
		XCTAssertEqual(dayInt!, expected)
	}
	
	func testMonthInt() throws {
		let expected = 10
		
		let date = dateFormatter.date(from: "2022-10-15T00:00:00")
		let monthInt = date?.monthInt
		
		XCTAssertEqual(monthInt!, expected)
	}
	
	func testMonthFullName() throws {
		let expected = "October"
		
		let date = dateFormatter.date(from: "2022-10-15T00:00:00")
		let month = date?.monthFullName
		
		XCTAssertEqual(month!, expected)
	}
	
	func testStartOfCalendarWithPrefixDays() throws {
		let expected = dateFormatter.date(from: "2022-09-26T00:00:00")
		
		let date = dateFormatter.date(from: "2022-10-15T00:00:00")
		let startOfMonthWithPrefix = date?.startOfCalendarWithPrefixDays
		
		XCTAssertEqual(startOfMonthWithPrefix, expected)
	}
}
