//
//  SwiftUIView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarDateItemView: View {
	var date: Int
	var logCount: Int
	
    var body: some View {
		Text("\(date)")
			.frame(maxWidth: .infinity, minHeight: 40)
			.background(
				Circle()
					.foregroundColor(
						getIntesity()
					)
			)
    }
	
	private func getIntesity() -> Color {
		return .teal.opacity(0.2 * Double(logCount))
	}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
		CalendarDateItemView(date: 2, logCount: 4)
    }
}
