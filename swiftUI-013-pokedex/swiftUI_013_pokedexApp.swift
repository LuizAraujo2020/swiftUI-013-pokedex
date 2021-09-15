//
//  swiftUI_013_pokedexApp.swift
//  swiftUI-013-pokedex
//
//  Created by Luiz Carlos da Silva Araujo on 13/09/21.
//

import SwiftUI

@main
struct swiftUI_013_pokedexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            PokedexView()
        }
    }
}
