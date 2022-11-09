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
	@State private var presentAddLogEntrySheet = false

    var body: some View {
		VStack {
			VStack {
				CalendarHeaderView()

				LazyVGrid(columns: columnsConfiguration) {
					ForEach(viewModel.calendarItems, id: \.date) { day in
						if !day.isFromPreviousMonth {
							CalendarDateItemView(item: day, logCount: day.getLogCount)
								.onTapGesture {
									viewModel.currentPosition = day.id
								}
						} else {
							Text("")
						}
					}
				}
			}.padding()

			LogListView(currentPostion: $viewModel.currentPosition, listData: viewModel.calendarItems)

			Button {
				presentAddLogEntrySheet = true
			} label: {
				Label("Add new Entry", systemImage: "plus")
			}
			.buttonStyle(.borderedProminent)
			.padding()

		}
		.sheet(isPresented: $presentAddLogEntrySheet) {
			AddLogEntryView(isShown: $presentAddLogEntrySheet)
				.presentationDetents([.medium])
		}
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
