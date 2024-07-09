//
//  CustomTextField.swift
//  Weathering Heights
//
//  Created by Jayanth R on 09/07/2024.
//

import SwiftUI

struct CustomTextField: View {
    var hint: String
    var isPassword: Bool = false
    @Binding var value: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 327, height: 50)
                .background(.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.83, green: 0.85, blue: 0.87), lineWidth: 1)
                )

            if isPassword {
                SecureField(text: $value) {
                    Text(hint)
                        .font(.custom("rubik-medium", size: 16))
                        .foregroundStyle(.gray)
                        .opacity(0.8)
                        .padding()
                }
                .frame(width: 295, height: 50)

            } else {
                TextField(text: $value) {
                    Text(hint)
                        .font(.custom("rubik-medium", size: 16))
                        .foregroundStyle(.gray)
                        .opacity(0.8)
                        .padding()
                }
                .frame(width: 295, height: 50)
            }
        }
    }
}
