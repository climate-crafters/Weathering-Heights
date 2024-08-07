//
//  Login.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct Login: View {
    @Binding var showLogin: Bool
    
    @State private var emailId: String = ""
    @State private var password: String = ""
    @State private var showForgetPasswordView: Bool = false
    @State private var showResetView: Bool = false
    
    @State var emailIdIsValid: Bool = true
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15, content: {
                Button(action: {
                    showLogin = false
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundStyle(.gray)
                })
                .padding(.top, 10)
                
                Spacer(minLength: 0)
                
                Text("Login")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundStyle(.white)
                    
                Text("Please sign in to continue")
                    .font(.custom("Rubik-Regular", size: 18))
                    .foregroundStyle(.white)
                    .padding(.top, -5)
                
                VStack(spacing: 25) {
                    /// Custom Text Fields
                    CustomTF(sfIcon: "at", hint: "Email Id", value: $emailId)
                        .autocapitalization(.none)
                        .foregroundColor(emailIdIsValid ? .green : .red)
                        .onChange(of: emailId) { newValue, _ in
                            if newValue.range(of: "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil {
                                self.emailIdIsValid = true
                            } else {
                                self.emailIdIsValid = false
                            }
                        }
                    
                    CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                        .padding(.top, 5)
                    
                    Button("Forgot Password?") {
                        showForgetPasswordView.toggle()
                    }
                    .foregroundStyle(.teal)
                    .font(.callout)
                    .fontWeight(.heavy)
                    .tint(Color(UIColor(red: 7/255, green: 71/255, blue: 37/255, alpha: 1)))
                    .hSpacing(.trailing)
                    
                    /// Login Button
                    GradientButton(title: "Login", icon: "arrow.right") {}
                        .hSpacing(.trailing)
                        /// Disabling Until the Data is Entered
                        .disableWithOpacity(emailId.isEmpty || password.isEmpty)
                }
                .padding(.top, 20)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                HStack(spacing: 6) {
                    Text("Don't have an Account?")
                        .foregroundStyle(.white)
                    
                    Button("SignUp") {
                        showLogin = false
                    }
                    .fontWeight(.bold)
                    .tint(.teal)
                }
                .font(.callout)
                .hSpacing()
            })
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showForgetPasswordView, content: {
                if #available(iOS 16.4, *) {
                    ForgotPassword(showResetView: $showResetView)
                        .presentationDetents([.height(300)])
                        .presentationCornerRadius(30)
                } else {
                    ForgotPassword(showResetView: $showResetView)
                        .presentationDetents([.height(300)])
                }
            })
        }
    }
}

#Preview {
    LoginView()
}
