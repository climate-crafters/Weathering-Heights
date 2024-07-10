//
//  Gradients.swift
//  login
//
//  Created by Hemanth Sai Dasari on 01/07/2024.
//

import SwiftUI

struct GradientButton2: View {
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
            .background(.linearGradient(colors: [Color(UIColor(red: 7/255, green: 71/255, blue: 37/255, alpha: 1)), Color(UIColor(red: 6/255, green: 60/255, blue: 29/255, alpha: 1)), Color(UIColor(red: 6/255, green: 48/255, blue: 24/255, alpha: 1))], startPoint: .top, endPoint: .bottom), in: .capsule)
        })
    }
}

#Preview {
    LoginView()
}
