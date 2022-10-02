//
//  CalendarHeaderView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarHeaderView: View {
	let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
	var font: Font = .body
	
	var body: some View {
		HStack {
			ForEach(daysOfWeek, id: \.self) { dayOfWeek in
				Text(dayOfWeek)
					.font(font)
					.fontWeight(.black)
					.foregroundColor(.teal)
					.frame(maxWidth: .infinity)
			}
		}
	}
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView()
    }
}
