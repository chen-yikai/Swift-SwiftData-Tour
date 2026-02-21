//
//  Swift_SwiftData_TourApp.swift
//  Swift-SwiftData-Tour
//
//  Created by Elias on 2026/2/21.
//

import SwiftUI
import SwiftData

@main
struct Swift_SwiftData_TourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Task.self)
    }
}
