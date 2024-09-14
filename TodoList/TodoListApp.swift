//
//  TodoListApp.swift
//  TodoList
//
//  Created by Huseyin on 11/09/2024.
//

import SwiftUI
import SwiftData

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
        
    }
}
