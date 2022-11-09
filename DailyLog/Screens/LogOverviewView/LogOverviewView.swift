//
//  LogOverviewView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct LogOverviewView: View {
    @StateObject var viewModel = LogOverviewViewModel()
	@State private var presentAddLogEntrySheet = false

    var body: some View {
		VStack {
			CalendarVIew(calendarItems: $viewModel.calendarItems,
						 currentPosition: $viewModel.currentPosition)

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
				.onDisappear {
					viewModel.loadData()
				}
		}
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        LogOverviewView()
    }
}
