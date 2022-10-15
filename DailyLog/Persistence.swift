//
//  Persistence.swift
//  DailyLog
//
//  Created by Julian Schenkemeyer on 02.10.22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        for _ in 0 ..< 10 {
            //            let newItem = Item(context: viewContext)
            //            newItem.timestamp = Date()
            let newDay = Day(context: viewContext)
            newDay.date = Date()
            let newMood = Log(context: viewContext)
            newMood.rating = "🤨"
            newMood.note = "Everything is quite confusing today"

            newDay.logs = Set([newMood]) as NSSet
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate.
			// You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DailyLog")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
				// You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection
				 * when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 * Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    static func save() {
        // 1
        let context =
            PersistenceController.shared.container.viewContext
        // 2
        guard context.hasChanges else { return }

        // 3
        do {
            try context.save()
        } catch {
            fatalError(
                """
                \(#file), \
                \(#function), \
                \(error.localizedDescription)
                """
            )
        }
    }
}
