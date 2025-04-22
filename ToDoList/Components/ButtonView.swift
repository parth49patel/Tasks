//
//  ButtonView.swift
//  ToDoList
//
//  Created by Parth Patel on 2025-04-21.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonName: String
    var icon: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        VStack {
            Label(buttonName, systemImage: icon)
                .font(.headline)
                .foregroundStyle(textColor)
                .padding(10)
                .background(Color(backgroundColor))
                .clipShape(Capsule())
        }
    }
}

#Preview {
    ButtonView(buttonName: "Save", icon: "square.and.arrow.down.fill", backgroundColor: .blue, textColor: .white)
}
