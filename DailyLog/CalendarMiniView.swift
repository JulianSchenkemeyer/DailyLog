//
//  CalendarMiniView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarMiniView: View {
	let columnConfig = Array(repeating: GridItem(.flexible()), count: 1)
	let Weekdays = Array(zip(Weekday.allCases, Weekday.allCases.indices))
	
    var body: some View {
		VStack {
			ScrollView(.horizontal) {
				LazyHGrid(rows: columnConfig) {
					ForEach(Weekdays, id: \.0) { (day, index ) in
						VStack {
							Text(day.rawValue)
							
//							CalendarDateItemView(date: index, logCount: Int.random(in: 0..<5))
						}.padding(10)
					}
				}
			}
		}
		.padding()
    }
}

struct CalendarMiniView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMiniView()
    }
}
