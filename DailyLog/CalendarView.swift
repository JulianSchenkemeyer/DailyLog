//
//  CalendarView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarView: View {
	let columnsConfiguration = Array(Array(repeating: GridItem(.flexible()), count: 7))
	
    var body: some View {
		VStack {
			CalendarHeaderView()
			
			LazyVGrid(columns: columnsConfiguration) {
				
				ForEach(1..<32) { day in
					CalendarDateItemView(date: day, isLogged: .random())
				}
			}
		}
		.padding()
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
