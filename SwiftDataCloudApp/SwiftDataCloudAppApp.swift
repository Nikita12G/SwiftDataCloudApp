//
//  SwiftDataCloudAppApp.swift
//  SwiftDataCloudApp
//
//  Created by Никита Гуляев on 03.09.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataCloudAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Contact.self], isUndoEnabled: true)
    }
}
