//
//  OTPVerificationView.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 05/07/2024.
//

import SwiftUI

struct OTPVerificationView: View {
    @Binding var otpText: String
    /// - KeyBoard State
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
        HStack(spacing: 0) {
            /// OTP Text Box
            /// Change Count Based on your OTP Text Size
            ForEach(0..<6, id: \.self) {
                index in OTPTextBox(index)
            }
        }
        .background(content : {
            TextField("", text: $otpText.limit(6))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                /// hiding it out
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        })
        .contentShape(Rectangle())
        /// Opening Keyboard when tapped
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    // Mark: OTP Text Box
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                /// finding char at index
                let startIndex = otpText.startIndex
                let CharIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[CharIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            /// - Highlighting Current Active Box
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? Color.primary : Color.gray, lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: isKeyboardShowing)
        }
        .frame(maxWidth: .infinity)
    }
}

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
