//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    init () {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    @StateObject var taskListViewModel = TaskListViewModel()
    var body: some Scene {
        WindowGroup {
                LogInView()
                    .environmentObject(taskListViewModel)
        }
    }
}
