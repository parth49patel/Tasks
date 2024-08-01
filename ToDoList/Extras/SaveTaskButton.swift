//
//  SaveTaskButton.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct SaveTaskButton: View {
    var body: some View {
        Text("Save Task")
            .font(.callout)
            .fontDesign(.monospaced)
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(colors: [Color(.systemPurple), Color(.systemIndigo)], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    SaveTaskButton()
}
