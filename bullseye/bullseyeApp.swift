//
//  bullseyeApp.swift
//  bullseye
//
//  Created by Said Tura Saidazimov on 26.04.2023.
//

import SwiftUI

@main
struct bullseyeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
