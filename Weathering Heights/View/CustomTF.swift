//
//  CustomTF.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .white
    var hint: String
    /// Hides TextField
    var isPassword: Bool = false
    @Binding var value: String
    /// View Properties
    @State private var showPassword: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundColor(.white)
                .foregroundStyle(.white)
                .frame(width: 30)
                .offset(y: 2)
            
            VStack(alignment: .leading,spacing: 8, content: {
                if isPassword {
                    Group {
                        /// Revealing Password when users wants to show Password
                        if showPassword {
                            TextField("", text: $value, prompt: Text(hint).foregroundColor(.gray))
                                .font(.custom("Rubik-Light", fixedSize: 17.5))
                        } else {
                            SecureField("", text: $value, prompt: Text(hint).foregroundColor(.gray))
                                .font(.custom("Rubik-Light", fixedSize: 17.5))

                        }
                    }
                } else {
                    TextField("", text: $value, prompt: Text(hint).foregroundColor(.gray))
                        .font(.custom("Rubik-Light", fixedSize: 17.5))
                }
                
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                /// Password Reval Button
                if isPassword {
                    Button(action: {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }, label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.white)
                            .padding(10)
                            .contentShape(.capsule)
                    })
                }
            }
        })
    }
}

