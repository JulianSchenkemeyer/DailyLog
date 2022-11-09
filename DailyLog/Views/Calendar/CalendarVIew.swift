//
//  CalendarVIew.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 09.11.22.
//

import SwiftUI

struct CalendarVIew: View {
	let columnsConfiguration = Array(Array(repeating: GridItem(.flexible()), count: 7))

	@Binding var calendarItems: [CalendarItem]
	@Binding var currentPosition: String

    var body: some View {
		VStack {
			CalendarHeaderView()

			LazyVGrid(columns: columnsConfiguration) {
				ForEach(calendarItems, id: \.date) { day in
					if !day.isFromPreviousMonth {
						CalendarDateItemView(item: day, logCount: day.getLogCount)
							.onTapGesture {
								currentPosition = day.id
							}
					} else {
						Text("")
					}
				}
			}
		}
		.padding()
    }
}

struct CalendarVIew_Previews: PreviewProvider {
    static var previews: some View {
		CalendarVIew(calendarItems: .constant([]), currentPosition: .constant(""))
    }
}
