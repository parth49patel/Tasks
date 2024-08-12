//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import Foundation

@MainActor
class TaskListViewModel: ObservableObject {
    
    @Published var tasks: [TaskListModel] = [] {
        didSet {
            saveTasks()
        }
    }
    let tasksKey: String = "tasks_key"
    init() {
       getTasks()
    }
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: tasksKey),
              let savedTasks = try? JSONDecoder().decode([TaskListModel].self, from: data) else {
            return
        }
        self.tasks = savedTasks
    }
    func addTask(title: String) {
        let newTask = TaskListModel(task: title, isCompleted: false)
        tasks.append(newTask)
    }
    func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks){
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    func updateTask(task: TaskListModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task.updateCompletion()
        }
    }
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
}
