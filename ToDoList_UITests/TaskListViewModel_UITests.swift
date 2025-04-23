//
//  TaskListViewModel_UITests.swift
//  ToDoList_UITests
//
//  Created by Parth Patel on 2025-04-22.
//

import XCTest

class TaskListViewModel_UITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_TasksList_AddTask() {
     
        //Given
        let button = app.buttons["Add Task"]
        button.tap()
        
        // When
        let textField = app.textFields["Enter task.."]
        textField.tap()
        
        let sKey = app.keys["S"]
        sKey.tap()
        let mKey = app.keys["m"]
        mKey.tap()
        let oKey = app.keys["o"]
        oKey.tap()
        oKey.tap()
        let tKey = app.keys["t"]
        tKey.tap()
        let hKey = app.keys["h"]
        hKey.tap()
        let iKey = app.keys["i"]
        iKey.tap()
        let eKey = app.keys["e"]
        eKey.tap()
    
        let saveButton = app.buttons["Save"]
        saveButton.tap()
        let navBar = app.navigationBars["Tasks"]
        
        // Then
        XCTAssert(navBar.exists)
        
    }
}
