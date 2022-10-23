//
//  CalendarHeaderView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import SwiftUI

struct CalendarHeaderView: View {
    var font: Font = .body

    var body: some View {
        HStack {
            ForEach(Weekday.allCases) { dayOfWeek in
                CalendarHeaderItemView(day: dayOfWeek)
            }
        }
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView()
    }
}
