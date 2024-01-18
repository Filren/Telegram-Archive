//
//  YourApp.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import SwiftUI


struct YourApp: App {
    @StateObject private var clientManager = ClientManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clientManager)
        }
    }
}
