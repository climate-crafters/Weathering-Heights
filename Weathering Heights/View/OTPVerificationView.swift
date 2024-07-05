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
        Text("Verify OTP")
            .font(.largeTitle.bold())
            .frame(maxWidth: .infinity,alignment: .leading)
        
        HStack(spacing: 0) {
            /// OTP Text Box
            /// Change Count Based on your OTP Text Size
            ForEach(0..<6, id \.self) {
                index in OTPTextBox(index)
            }
        }
    }
}
