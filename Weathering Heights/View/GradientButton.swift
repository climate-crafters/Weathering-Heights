//
//  Gradients.swift
//  login
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
                    .foregroundColor(.black)
                Image(systemName: icon)
            }
            .fontWeight(.heavy)
            .foregroundStyle(.black)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.white
                        , in: .capsule)
        })
    }
}

#Preview {
    LoginView()
}
