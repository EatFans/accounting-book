//
//  accountingbookApp.swift
//  accountingbook
//
//  Created by EatFan on 2025/6/9.
//

import SwiftUI

@main
struct accountingbookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
