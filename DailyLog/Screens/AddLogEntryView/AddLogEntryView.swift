//
//  AddLogEntryView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 06.11.22.
//

import SwiftUI

struct AddLogEntryView: View {

	@Binding var isShown: Bool
	@StateObject private var viewModel = AddLogEntryViewModel()

	let ratingOptions = ["🤣", "😀", "🤨", "🤯", "😢", "😡", "🤬"]

	var body: some View {

		VStack(spacing: 20) {
			Picker(selection: $viewModel.rating) {
				ForEach(ratingOptions, id: \.self) { option in
					Text(option)
				}
			} label: {
				Text("Rating")
			}
			.pickerStyle(.segmented)

			TextField("Note", text: $viewModel.note, axis: .vertical)
				.lineLimit(5...)
				.textFieldStyle(.roundedBorder)

			Spacer()

			Button {
				print(viewModel.rating, viewModel.note)
				viewModel.saveLogEntry()
				isShown = false
			} label: {
				Text("Save new log entry")
			}
			.buttonStyle(.borderedProminent)

			Spacer()

		}
		.padding()

	}
}

struct AddLogEntryView_Previews: PreviewProvider {
	static var previews: some View {
		AddLogEntryView(isShown: .constant(true))
	}
}
