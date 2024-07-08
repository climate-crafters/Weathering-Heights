//
//  ContentView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 29/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .frame(minWidth: 0, maxWidth: .infinity)

                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, -400.0)
                    .frame(width: 350, height: 350)

                VStack {
                    Text("Welcome to\nWeather-ing Heights")
                        .font(.custom("rubik", size: 32))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.top, 275.0)

                    Text("\nDive into weather updates while exploring quizzes and activities designed to promote climate action.\n\nLet's work together to make a positive impact on our planet, one step at a time.")
                        .font(.title2)
                        .fontWeight(.light)
                        .padding(.bottom)
                        .frame(width: 315.0)
                        .foregroundStyle(.white)

                    NavigationLink(destination: Login_SignUp()) { Text("Next") }
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(.black)
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(8)
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
