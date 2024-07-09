//
//  WelcomeView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 29/06/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
//                Image("Background")
//                    .frame(minWidth: 0, maxWidth: 0)

                VStack {
                    Text("Welcome to\nWeathering Heights!")
                        .font(.custom("rubik-bold", size: 30))
                        .foregroundStyle(.black)
                        .padding()

                    Spacer()

                    Text("Dive into weather updates while exploring quizzes and activities designed to promote climate action.\n\nLet's work together to make a positive impact on our planet, one step at a time.")
                        .font(.custom("rubik", size: 22))
                        .foregroundStyle(.black)
                        .padding()

                    NavigationLink(destination: Login_SignUp()) {
                        Text("Next")
                            .font(.custom("rubik-semibold", size: 18))
                    }
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
