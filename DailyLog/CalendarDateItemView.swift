//
//  SwiftUIView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarDateItemView: View {
	var date: Int
	var isLogged: Bool
	
    var body: some View {
		Text("\(date)")
			.frame(maxWidth: .infinity, minHeight: 40)
			.background(
				Circle()
					.foregroundColor(
						.gray.opacity(isLogged ? 0.3 : 0.0)
					)
			)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
		CalendarDateItemView(date: 2, isLogged: true)
    }
}
