//
//  AddTask.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State var task: String = ""
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    dismiss()
                } label: {
                    DismissButton()
                }
                .offset(x: -160, y: 20)
                .padding(.bottom, 200)
                VStack{
                    TextField("Enter task..", text: $task)
                        .padding()
                        .font(.system(size: 20, design: .monospaced))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(
                            colorScheme == .light ?
                            LinearGradient(colors: [Color(.systemFill), Color("textField")], startPoint: .leading, endPoint: .trailing) :
                                LinearGradient(colors: [Color(.gray), Color("textField")], startPoint: .leading, endPoint: .trailing)
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
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    func saveTaskPressed() {
        taskListViewModel.addTask(title: task, modelContext: modelContext)
        dismiss()
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .modelContainer(for: TaskListModel.self)
            .environmentObject(TaskListViewModel())
    }
}
