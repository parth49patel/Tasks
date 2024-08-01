//
//  LogInView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-31.
//

import SwiftUI

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var signedIn = false
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    
    var body: some View {
            ZStack {
                Color.accentColor
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("TO DO LIST")
                        Image(systemName: "list.bullet.clipboard.fill")
                    }
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .padding(.bottom, 100)
                    VStack {
                        TextField("Email", text: $email)
                            .frame(height: 40)
                            .padding(.horizontal, 10)
                            .background(Color.white.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 10))
                        
                        SecureField("Password", text: $password)
                            .frame(height: 40)
                            .padding(.horizontal, 10)
                            .background(Color.white.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .font(.title)
                    .padding()
                    .background(
                        Rectangle().fill(Color.blue).opacity(0.2).clipShape(.rect(cornerRadius: 10))
                    )
                    .padding()
            }
        }
    }
}

#Preview {
    LogInView()
        .environmentObject(TaskListViewModel())
}
