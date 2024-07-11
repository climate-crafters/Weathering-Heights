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
            HStack(alignment: .center, spacing: 15.0) {
                Text(title)
                    .foregroundColor(.white)
                Image(systemName: icon)
            }
            .fontWeight(.heavy)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.black
                        , in: .capsule)
        })
        .padding(.trailing, 82.0)
    }
}

#Preview {
    LoginView()
}
