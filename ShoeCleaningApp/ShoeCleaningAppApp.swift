//
//  ShoeCleaningAppApp.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//
import SwiftUI
import SwiftData

@main
struct ShoeCleaningAppApp: App {
    @StateObject var sharedModelContainer: ModelContainer

    init() {        do {
            let schema = try SchemaHelper.createSchema(for: [Item.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedModelContainer)
        }
    }
}
