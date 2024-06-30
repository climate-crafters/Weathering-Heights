//
//  GradientButton.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var icon: String
    var onClick: () -> ()
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [Color(UIColor(red: 254/255, green: 206/255, blue: 57/255, alpha: 1)), .orange, .red], startPoint: .top, endPoint: .bottom), in: .capsule)
        })
    }
}

#Preview {
    SignInView()
}
