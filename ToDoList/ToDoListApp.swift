//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    
    var body: some Scene {
        WindowGroup {
            TasksList()
                .modelContainer(for: TaskListModel.self)
                .environmentObject(TaskListViewModel())
        }
    }
}
