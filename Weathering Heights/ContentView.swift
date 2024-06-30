//
//  ContentView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 29/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background").frame(minWidth: 0, maxWidth: .infinity).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Image("logo")
                .padding(.top, -300.0)
            VStack {
                Text("""
                     Welcome to
                     Weather-ing Heights
                     """).font(.largeTitle).bold().foregroundStyle(.white)
                Divider()
                Text("""
    Dive into weather updates while exploring quizzes and activities designed to promote climate action.
    Let's work together to make a positive impact on our planet, one step at a time.
    """).font(.title2).fontWeight(.light).padding(.bottom, -290.0).frame(width: 315.0).foregroundStyle(.white)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
