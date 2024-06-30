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
                    .edgesIgnoringSafeArea(.all)
                
                Image("logo")
                    .padding(.top, -300.0)
                
                VStack {
                    Text("""
                    Welcome to
                    Weather-ing Heights
                    """)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.top, 200.0)
                    
                    Divider()
                    
                    Text("""
                    Dive into weather updates while exploring quizzes and activities designed to promote climate action.
                    Let's work together to make a positive impact on our planet, one step at a time.
                    """)
                    .font(.title2)
                    .fontWeight(.light)
                    .padding(.bottom)
                    .frame(width: /*@START_MENU_TOKEN@*/315.0/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    
                    Divider()
                    Divider()
                    
                    NavigationLink(destination: SignUp()) { Text("Next →")
                    }
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color(UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
