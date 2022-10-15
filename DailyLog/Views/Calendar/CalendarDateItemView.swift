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
                Circle()
                    .foregroundColor(
                        getIntesity()
                    )
                    .overlay {
                        if item.isToday {
                            Circle()
                                .stroke(Color.black, lineWidth: 3)
                                .opacity(0.5)
                        }
                    }
            )
    }

    private func getIntesity() -> Color {
        if logCount == 0 {
            return .gray.opacity(0.1)
        }
        return .teal.opacity(0.2 * Double(logCount))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let calendarItem = CalendarItem(date: .now)

        CalendarDateItemView(item: calendarItem, logCount: 4)
    }
}
