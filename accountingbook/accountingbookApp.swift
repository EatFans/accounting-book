//
//  accountingbookApp.swift
//  accountingbook
//
//  Created by EatFan on 2025/6/9.
//

import SwiftUI

// App主入口，使用@main标记
@main
struct accountingbookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // 启动后显示主界面ContentView
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
