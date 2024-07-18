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
            ForEach(0 ..< 6, id: \.self) {
                index in self.OTPTextBox(index)
            }
        }
        .background(content: {
            TextField("", text: self.$otpText.limit(6))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                /// hiding it out
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused(self.$isKeyboardShowing)
        })
        .contentShape(Rectangle())
        /// Opening Keyboard when tapped
        .onTapGesture {
            self.isKeyboardShowing.toggle()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    self.isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }

    // MARK: OTP Text Box

    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if self.otpText.count > index {
                /// finding char at index
                let startIndex = self.otpText.startIndex
                let CharIndex = self.otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[CharIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            /// - Highlighting Current Active Box
            let status = (isKeyboardShowing && self.otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? Color.primary : Color.gray, lineWidth: status ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.2), value: self.isKeyboardShowing)
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
