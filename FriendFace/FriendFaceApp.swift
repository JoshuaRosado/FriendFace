//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Create a container
        .modelContainer(for: User.self)
    }
}
