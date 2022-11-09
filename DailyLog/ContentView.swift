//
//  ContentView.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import CoreData
import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			LogOverviewView()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
