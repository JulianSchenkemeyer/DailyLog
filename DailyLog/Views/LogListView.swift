//
//  LogListView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 23.10.22.
//

import SwiftUI

struct LogListView: View {
	@Binding var currentPostion: String
	var listData: [CalendarItem]

	var body: some View {
		ScrollViewReader { proxy in

			ScrollView {
				ForEach(listData) { item in
					// Only show entries of the current month
					if !item.isFromPreviousMonth {
						VStack(alignment: .leading) {
							Text(item.date.formatted(.dateTime.day().month(.wide).year()))
								.font(.headline)
								.bold()

							if let data = item.data, let logs = data.logs {
								LogListItems(logs: logs)
							} else {
								LogListItem(rating: "", note: "")
							}
						}
						.padding(.horizontal, 20)
						.padding(.vertical, 10)
						.id(item.id)
					}
				}
			}
			.listStyle(.plain)
			.onAppear {
				proxy.scrollTo("\(currentPostion)", anchor: .top)
			}
			.onChange(of: currentPostion) { newPosition in
				proxy.scrollTo("\(newPosition)", anchor: .top)
			}
		}
	}
}

struct LogListItems: View {
	var logs: NSSet

	var body: some View {
		if let logs = logs.allObjects as? [Log] {
			ForEach(logs) { data in
				LogListItem(rating: data.rating ?? "", note: data.note ?? "")
				.listRowSeparator(.hidden)
			}
		}
	}
}

struct LogListItem: View {
	let rating: String
	let note: String

	var body: some View {
		HStack {
			Text(rating)
			Text(note)
		}
		.frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
		.padding(10)
		.background(
			RoundedRectangle(cornerRadius: 20)
				.foregroundColor(.cyan)
				.opacity(0.3)
		)
	}

	init(rating: String, note: String) {
		self.rating = rating
		self.note = note.isEmpty ? "No notes" : note
	}
}

struct LogListView_Previews: PreviewProvider {
	static var previews: some View {
		LogListView(currentPostion: .constant(""), listData: [CalendarItem(date: .now), CalendarItem(date: .distantPast)])
	}
}
