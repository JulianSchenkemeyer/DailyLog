//
//  LogListView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 23.10.22.
//

import SwiftUI

struct LogListView: View {
	var listData: [CalendarItem]

	var body: some View {
		ScrollViewReader { value in

			Button("Jump to #8") {
				value.scrollTo(8, anchor: .top)
			}
			.padding()

			ScrollView {
				ForEach(listData) { item in
					LazyVStack(alignment: .leading) {
						Text(item.date.formatted(.dateTime.day().month(.wide).year()))
							.font(.headline)
							.bold()

						if let data = item.data, let logs = data.logs {
							LogListItems(logs: logs)
						}
					}
					.padding(.horizontal, 20)
					.padding(.vertical, 10)
					.id(item.id)
				}
			}
			.listStyle(.plain)
		}
	}
}

struct LogListItems: View {
	var logs: NSSet

	var body: some View {
		if let logs = logs.allObjects as? [Log] {
			ForEach(logs) { data in
				HStack {
					Text(data.rating ?? "")
					Text(data.note ?? "")
				}
				.frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
				.padding(10)
				.background(
					RoundedRectangle(cornerRadius: 20)
						.foregroundColor(.cyan)
						.opacity(0.3)
				)
				.listRowSeparator(.hidden)
			}
		}
	}
}

struct LogListView_Previews: PreviewProvider {
	static var previews: some View {
		LogListView(listData: [CalendarItem(date: .now), CalendarItem(date: .distantPast)])
	}
}
