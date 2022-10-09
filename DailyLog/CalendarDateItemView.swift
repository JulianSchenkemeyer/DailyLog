//
//  SwiftUIView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarDateItemView: View {
	var item: CalendarItem
	var logCount: Int
	
    var body: some View {
		Text("\(item.dayInt)")
			.frame(maxWidth: .infinity, minHeight: 40)
			.background(
				ZStack {
					if item.isToday {
						Circle()
							.foregroundColor(.black)
						Circle()
							.foregroundColor(.white)
							.padding(3)
					}
					Circle()
						.foregroundColor(
							getIntesity()
						)
						.padding(item.isToday ? 3 : 0)
					
					
				}
			)
    }
	
	private func getIntesity() -> Color {
		return .teal.opacity(0.2 * Double(logCount))
	}
}

struct SwiftUIView_Previews: PreviewProvider {
	
    static var previews: some View {
		let calendarItem = CalendarItem(date: .now)
		
		CalendarDateItemView(item: calendarItem , logCount: 4)
    }
}
