//
//  TaskListViewModel_Tests.swift
//  ToDoList_Tests
//
//  Created by Parth Patel on 2025-04-22.
//

import XCTest
import SwiftData
@testable import ToDoList

@MainActor
final class TaskListViewModel_Tests: XCTestCase {
    
    var modelContainer: ModelContainer!
    var modelContext: ModelContext!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let schema = Schema([TaskListModel.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        modelContainer = try ModelContainer(for: schema, configurations: [config])
        modelContext = ModelContext(modelContainer)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        modelContainer = nil
        modelContext = nil
    }
    
    func test_TaskListViewModel_addTask_shouldAddTaskToList() {
        // Given
        let viewModel = TaskListViewModel()
        let title = "Test Task"
        
        // When
        viewModel.addTask(title: title, tasks: [], modelContext: modelContext)
        
        // Then
        let fetchDescriptor = FetchDescriptor<TaskListModel>()
        let tasks = try! modelContext.fetch(fetchDescriptor)
        
        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first?.task, title)
        XCTAssertFalse(tasks.first?.isCompleted ?? true)
    }
    
    func test_TaskListViewModel_addTwoTasks_shouldAddTaskToList() {
        // Given
        let viewModel = TaskListViewModel()
        let title = "Test Task"
        let title2 = "Test Task2"
        // When
        viewModel.addTask(title: title, tasks: [], modelContext: modelContext)
        viewModel.addTask(title: title2, tasks: [], modelContext: modelContext)
        
        // Then
        let fetchDescriptor = FetchDescriptor<TaskListModel>()
        let tasks = try! modelContext.fetch(fetchDescriptor)
        
        XCTAssertEqual(tasks.count, 2)
        XCTAssertEqual(tasks.first?.task, title)
        XCTAssertFalse(tasks.first?.isCompleted ?? true)
    }
    
    func test_TaskListViewModel_updateTask_shouldUpdateTask() {
        // Given
        let viewModel = TaskListViewModel()
        let title = "Test Task"
        
        viewModel.addTask(title: title, tasks: [], modelContext: modelContext)
        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        XCTAssertEqual(tasks.count, 1)
        
        let task = tasks.first!
        let originalStatus = task.isCompleted
        
        // When
        viewModel.updateTask(task: task, modelContext: modelContext)
        
        // Then
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        
        XCTAssertEqual(tasks.first?.isCompleted, !originalStatus)
    }
    
    func test_TaskListViewModel_updateTask_shouldUpdateTaskTwice() {
        // Given
        let viewModel = TaskListViewModel()
        let title = "Test Task"
        
        // When
        viewModel.addTask(title: title, tasks: [], modelContext: modelContext)
        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        XCTAssertEqual(tasks.count, 1)
        
        viewModel.updateTask(task: tasks[0], modelContext: modelContext)
        viewModel.updateTask(task: tasks[0], modelContext: modelContext)

        // Then
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        XCTAssertTrue(!tasks[0].isCompleted)
    }
    
    
    func test_TaskListViewModel_addTwoTask2_shouldAddTaskToList() {
        // Given
        let viewModel = TaskListViewModel()
        let title1 = "Test Task"
        let title2 = "Test Task 2"
        
        // When
        viewModel.addTask(title: title1, tasks: [], modelContext: modelContext)
        viewModel.addTask(title: title2, tasks: [], modelContext: modelContext)

        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertEqual(tasks.count, 2)
        
        viewModel.updateTask(task: tasks[0], modelContext: modelContext)
        viewModel.updateTask(task: tasks[1], modelContext: modelContext)

        // Then
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        
        XCTAssertTrue(tasks[0].isCompleted)
        XCTAssertTrue(tasks[1].isCompleted)
    }
    
    func test_TaskListViewModel_deleteTask_shouldDeleteTaskFromList() {
        // Given
        let viewModel = TaskListViewModel()
        let title1 = "Test Task"
        
        // When
        viewModel.addTask(title: title1, tasks: [], modelContext: modelContext)
        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertEqual(tasks.count, 1)
        
        let indexSet = IndexSet(integer: 0)
        viewModel.deleteTask(indexSet: indexSet, tasks: tasks, modelContext: modelContext)
        
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))

        // Then
        XCTAssertEqual(tasks.count, 0)
    }
    
    func test_TaskListViewModel_deleteOneTaskFromTwoTasks_shouldDeleteTaskFromList() {
        // Given
        let viewModel = TaskListViewModel()
        let title1 = "Test Task"
        let title2 = "Second Task"
        
        // When
        viewModel.addTask(title: title1, tasks: [], modelContext: modelContext)
        viewModel.addTask(title: title2, tasks: [], modelContext: modelContext)

        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertEqual(tasks.count, 2)
        
        let indexSet = IndexSet(integer: 0)
        viewModel.deleteTask(indexSet: indexSet, tasks: tasks, modelContext: modelContext)
        
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))

        // Then
        XCTAssertEqual(tasks.count, 1)
    }
    
    func test_TaskListViewModel_deleteOneTaskAndUpdateOneTask_shouldDeleteAndUpdateTaskFromList() {
        // Given
        let viewModel = TaskListViewModel()
        let title1 = "Test Task"
        let title2 = "Second Task"
        
        // When
        viewModel.addTask(title: title1, tasks: [], modelContext: modelContext)
        viewModel.addTask(title: title2, tasks: [], modelContext: modelContext)

        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertEqual(tasks.count, 2)
        
        let indexSet = IndexSet(integer: 1)
        viewModel.deleteTask(indexSet: indexSet, tasks: tasks, modelContext: modelContext)
        viewModel.updateTask(task: tasks[0], modelContext: modelContext)

        // Then
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertTrue(tasks[0].isCompleted)
        XCTAssertEqual(tasks.count, 1)
    }
    
    func test_TaskListViewModel_reOrderTasks_shouldReOrderTasksFromList() {
        // Given
        let viewModel = TaskListViewModel()
        let title1 = "Test Task"
        let title2 = "Second Task"
        
        // When
        viewModel.addTask(title: title1, tasks: [], modelContext: modelContext)
        viewModel.addTask(title: title2, tasks: [], modelContext: modelContext)
        var tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>())
        XCTAssertEqual(tasks.count, 2)
        
        viewModel.moveTasks(indices: IndexSet(integer: 0), newOffset: 2, tasks: tasks, modelContext: modelContext)
        
        // Then
        tasks = try! modelContext.fetch(FetchDescriptor<TaskListModel>(sortBy: [SortDescriptor(\.order)]))
        XCTAssertEqual(tasks.count, 2)
        XCTAssertEqual(tasks[0].task, title2)
        XCTAssertEqual(tasks[1].task, title1)
    }
}
