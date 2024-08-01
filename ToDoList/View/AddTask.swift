//
//  AddTask.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct AddTask: View {
    
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var task: String = ""
    
    var body: some View {
        VStack{
            TextField("Enter task..", text: $task)
                .padding()
                .font(.system(size: 20, design: .monospaced))
                .frame(maxWidth: .infinity)
                .foregroundStyle(.black)
                .background(
                    LinearGradient(colors: [Color(.systemFill), Color("textField")], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(.rect(cornerRadius: 10))
            
            Button {
                saveTaskPressed()
            } label: {
                SaveTaskButton()
            }
            .padding(.top, 50)
        }
        .padding()
    }
    func saveTaskPressed() {
        taskListViewModel.addTask(title: task)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .environmentObject(TaskListViewModel())
    }
}
