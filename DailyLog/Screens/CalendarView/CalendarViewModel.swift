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

        startDateWithPrefix = today.startOfCalendarWithPrefixDays
        endDate = today.endOfMonth

        calendarItems = createCalendarItemsForDisplayedMonth(start: startDateWithPrefix, end: endDate)
    }

    func createCalendarItemsForDisplayedMonth(start: Date, end: Date) -> [CalendarItem] {
        var calendarItems: [CalendarItem] = []

        var iterator = start
        while iterator < end {
            let newCalendarItem = CalendarItem(date: iterator)
            calendarItems.append(newCalendarItem)
            iterator = Calendar.current.date(byAdding: .day, value: 1, to: iterator)!
        }

        return calendarItems
    }
}
