//
//  TaskListModel.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import Foundation
 
struct TaskListModel: Identifiable, Codable {
    let id: String
    let task: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, task: String, isCompleted: Bool) {
        self.id = id
        self.task = task
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TaskListModel {
        return TaskListModel(id: id, task: task, isCompleted: !isCompleted)
    }
}
