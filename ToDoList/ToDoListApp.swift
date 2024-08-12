//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    
    var body: some Scene {
        WindowGroup {
            TasksList()
                .environmentObject(TaskListViewModel())
        }
    }
}
