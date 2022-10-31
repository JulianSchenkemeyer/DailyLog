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

							LogListItems(logs: item.logs)
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
	var logs: [Log]

	var body: some View {
		if logs.count > 0 {
			ForEach(logs) { data in
				LogListItem(
					rating: data.rating ?? "",
					note: data.note ?? "",
					backgroundColor: .cyan
				)
				.listRowSeparator(.hidden)
			}
		} else {
			LogListItem(
				rating: " ",
				note: "no notes for this day",
				backgroundColor: .gray.opacity(0.5))
		}

	}
}

struct LogListItem: View {
	let rating: String
	let note: String
	let backgroundColor: Color

	var body: some View {
		HStack {
			Text(rating)
			Text(note)
		}
		.frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
		.padding(10)
		.background(
			RoundedRectangle(cornerRadius: 20)
				.foregroundColor(backgroundColor)
				.opacity(0.3)
		)
	}
}

struct LogListView_Previews: PreviewProvider {
	static var previews: some View {
		LogListView(currentPostion: .constant(""), listData: [CalendarItem(date: .now), CalendarItem(date: .distantPast)])
	}
}
