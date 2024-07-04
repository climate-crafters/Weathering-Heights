//
//  ForgotPassword.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 04/07/2024.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    
    @State private var emailId: String = ""
    
    @State var emailIdIsValid: Bool = true
    
    @Environment(\.dismiss) private var dismiss
   
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            /// Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            
            Text("Please enter your Email ID so that we can send the reset link.")
                .font(.caption)
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                /// Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email Id", value: $emailId)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .foregroundColor(emailIdIsValid ? Color.green : Color.red)
                    .onChange(of: emailId) { newValue in
                        if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                            self.emailIdIsValid = true
                        } else {
                            self.emailIdIsValid = false
                        }
                    }
                
                /// SignUp Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    dismiss()
                }
                .hSpacing(.trailing)
                /// Disabling Until the Data is Entered
                .disableWithOpacity(emailId.isEmpty || !emailIdIsValid)
            }
            .padding(.top, 20)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        
        .interactiveDismissDisabled()
    }
}


#Preview {
    Login_SignUp()
}
