//
//  CustomTF.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    /// Hides TextField
    var isPassword: Bool = false
    @Binding var value: String
    /// View Properties
    @State private var showPassword: Bool = false
    var body: some View {
        Rectangle()
            .fill(.white)
            .cornerRadius(8)
            .frame(width: 350, height: 45)
            .overlay {
                HStack(alignment: .top, content: {
                    Image(systemName: sfIcon)
                        .foregroundStyle(iconTint)
                        .frame(width: 30)
                        .offset(y: 2)
                        
                    VStack(alignment: .leading,spacing: 8, content: {
                        if isPassword {
                            Group {
                                /// Revealing Password when users wants to show Password
                                if showPassword {
                                    TextField(hint, text: $value)
                                        .font(.custom("Rubik-Light", fixedSize: 17.5))
                                } else {
                                    SecureField(hint, text: $value)
                                        .font(.custom("Rubik-Light", fixedSize: 17.5))
                                        
                                }
                            }
                        } else {
                            TextField("", text: $value, prompt: Text(hint).foregroundColor(.gray))
                                .font(.custom("Rubik-Light", fixedSize: 17.5))
                        }
                        
                    })
                    .overlay(alignment: .trailing) {
                        /// Password Reval Button
                        if isPassword {
                            Button(action: {
                                showPassword.toggle()
                            }, label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundStyle(iconTint)
                                    .padding(10)
                            })
                        }
                    }
                })
            }
    }
}

