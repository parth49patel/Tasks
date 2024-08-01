//
//  LogInButton.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-31.
//

import SwiftUI

struct LogInButton: View {
    var body: some View {
        Text("Log In")
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
    LogInButton()
}
