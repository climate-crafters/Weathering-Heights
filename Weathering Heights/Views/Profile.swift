//
//  About Us.swift
//  Weathering Heights
//
//  Created by Hemanth Sai Dasari on 08/07/2024.
//

import PhotosUI
import SwiftUI

struct Profile: View {
    @State private var profilePhoto: UIImage?
    @State private var selectedPhoto: PhotosPickerItem?

    @State private var showAnimation = true

    var body: some View {
        ZStack {
            Color(uiColor: UIColor.secondarySystemBackground)
                .ignoresSafeArea()

            VStack {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Image(uiImage: profilePhoto ?? UIImage(resource: .avatar))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                }
                .onChange(of: selectedPhoto, loadImage)
                .padding()

                Text("Username")
                    .font(.title2)
                    .bold()

                Text("Eco-action Level x")
                    .padding(.bottom)

                HStack {
                    Image(systemName: "tree.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .symbolRenderingMode(.multicolor)
                        .symbolEffect(.bounce, value: showAnimation)
                        .onTapGesture {
                            showAnimation.toggle()
                        }
                        .onAppear {
                            showAnimation.toggle()
                        }
                        .padding(.top, 30)
                        .padding(.trailing)

                    Text("Good job!\nYou've planted x trees!")
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                        .padding(.leading)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func loadImage() {
        Task {
            if let selectedPhoto,
               let data = try? await selectedPhoto.loadTransferable(type: Data.self)
            {
                if let image = UIImage(data: data) {
                    profilePhoto = image
                }
            }
            selectedPhoto = nil
        }
    }
}

#Preview {
    Profile()
}
