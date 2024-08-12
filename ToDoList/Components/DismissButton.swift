//
//  DismissButton.swift
//  ToDoList
//
//  Created by Parth Patel on 2024-08-12.
//

import SwiftUI

struct DismissButton: View {
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Circle()
            .frame(width: 50)
            .foregroundStyle(colorScheme == .light ? .textField : .gray)
            .overlay {
                Text("X")
                    .foregroundStyle(colorScheme == .light ? .black : .white )
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
            }
    }
}

#Preview {
    DismissButton()
}
