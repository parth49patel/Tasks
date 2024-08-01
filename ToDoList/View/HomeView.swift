//
//  HomeView.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TasksList()
                .tabItem {
                    Label("Tasks", systemImage: "pencil.and.list.clipboard")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(TaskListViewModel())
}
