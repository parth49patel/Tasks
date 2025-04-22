//
//  TaskListModel.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import Foundation
import SwiftData

@Model
class TaskListModel: ObservableObject {
    @Attribute(.unique) var id: String
    var task: String
    var isCompleted: Bool
    var order: Int
    
    init(id: String = UUID().uuidString, task: String, isCompleted: Bool, order: Int) {
        self.id = id
        self.task = task
        self.isCompleted = isCompleted
        self.order = order
    }
}
