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
                Image("Background")

                VStack {
                    Text("Welcome to\nWeathering Heights!")
                        .frame(width: 320)
                        .font(.custom("rubik-medium", size: 30))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.top, 125)

                    Spacer()

                    Group {
                        Text("Dive into weather updates while exploring quizzes and activities designed to promote climate action.")
                            .frame(width: 320)
                            .font(.custom("rubik", size: 22))
                            .foregroundStyle(.white)

                        Text("Let's work together to make a positive impact on our planet, one step at a time.")
                            .frame(width: 320)
                            .font(.custom("rubik", size: 22))
                            .foregroundStyle(.white)
                    }
                    .padding()

                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        Text("Next")
                            .font(.custom("rubik-medium", size: 18))
                    }
                    .frame(width: 300, height: 50)
                    .background(.black)
                    .foregroundStyle(.white)
                    .cornerRadius(40)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    .padding(.bottom, 100)
                    .padding(.top, 25)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
