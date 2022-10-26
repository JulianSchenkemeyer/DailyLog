//
//  CalendarView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarView: View {
    let columnsConfiguration = Array(Array(repeating: GridItem(.flexible()), count: 7))

    @StateObject var viewModel = CalendarViewModel()

    var body: some View {
        VStack {
			VStack {
				CalendarHeaderView()
				
				LazyVGrid(columns: columnsConfiguration) {
					ForEach(viewModel.calendarItems, id: \.date) { day in
						if !day.isFromPreviousMonth {
							CalendarDateItemView(item: day, logCount: day.getLogCount)
						} else {
							Text("")
						}
					}
				}
			}.padding()

			LogListView(listData: viewModel.calendarItems)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
