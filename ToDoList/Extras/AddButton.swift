//
//  AddButton.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-07-22.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Rectangle()
            .overlay(Color.white)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(
                Text("+")
                    .foregroundStyle(.blue)
                    .font(.system(size: 30, weight: .semibold))
                    .offset(x: 0, y: -1)
            )
    }
}

#Preview {
    AddButton()
}
