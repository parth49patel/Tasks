//
//  AddButton.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct AddNewTaskButton: View {
    
    @State var addTaskView: Bool = false
    
    var body: some View {
        Button {
            addTaskView.toggle()
        } label: {
            HStack{
                Text("Add Task")
                Image(systemName: "plus.circle")
            }
            .font(.headline)
            .foregroundStyle(.black)
        }
        .padding(10)
        .background(Color("textField"))
        .clipShape(Capsule())
        .sheet(isPresented: $addTaskView) {
            AddTask()
        }
    }
}

#Preview {
    AddNewTaskButton()
}
