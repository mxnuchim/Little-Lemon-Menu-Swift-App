//
//  LittleLemonMenuApp.swift
//  LittleLemonMenu
//
//  Created by Manuchimso Oliver on 30/01/2023.
//

import SwiftUI

@main
struct LittleLemonMenuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RegistrationScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
