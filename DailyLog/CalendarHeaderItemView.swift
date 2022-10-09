//
//  CalendarHeaderItemView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 05.10.22.
//

import SwiftUI

struct CalendarHeaderItemView: View {
	let day: Weekday
	var font: Font = .body
	
    var body: some View {
		Text(day.rawValue)
			.font(font)
			.fontWeight(.black)
			.foregroundColor(.teal)
			.frame(maxWidth: .infinity)
    }
}

struct CalendarHeaderItemView_Previews: PreviewProvider {
    static var previews: some View {
		CalendarHeaderItemView(day: Weekday.Mon)
    }
}
