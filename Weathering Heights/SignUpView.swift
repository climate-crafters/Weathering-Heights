//
//  SignUpView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 09/07/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var emailID: String = ""
    @State private var password: String = ""

    var body: some View {
        ZStack {
            Image("Background")

            VStack {
                Text("Tell us more about yourself")
                    .frame(width: 320)
                    .font(.custom("rubik-medium", size: 30))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.top, 125)

                Spacer()

                CustomTextField(hint: "Name", value: $name)
                CustomTextField(hint: "Email", value: $emailID)
                CustomTextField(hint: "Password", isPassword: true, value: $password)

                HStack {
                    Text("Already have an account?")
                        .font(.custom("rubik", size: 18))
                        .foregroundStyle(.white)
                        .padding(.vertical)

                    Text("Login")
                        .font(.custom("rubik", size: 18))
                        .underline()
                        .padding(.vertical)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    SignUpView()
}
