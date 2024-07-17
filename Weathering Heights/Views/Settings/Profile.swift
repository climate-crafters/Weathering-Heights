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
    @State private var username: String = "Username"
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var historyList = ["Charity", "AED 50 Voucher", "AED 50 Voucher"]

    @State private var selectedPhoto: PhotosPickerItem?
    @State private var showAnimation = true
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: colorScheme == .dark ? UIColor.systemBackground : UIColor.secondarySystemBackground)
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

                    Text(username)
                        .font(.custom("rubik-semibold", size: 20))

                    Text("Eco-action Level 4")
                        .font(.custom("rubik", size: 18))
                        .padding(.bottom)

                    VStack {
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
                            .padding(.top)

                        Text("50")
                            .font(.custom("rubik-bold", size: 30))

                        Text("Trees Planted")
                            .font(.custom("rubik", size: 18))
                            .padding(.bottom)
                    }

                    Form {
                        Section(header: Text("Credentials").font(.custom("rubik", size: 14))) {
                            NavigationLink("Username", destination: {
                                Form {
                                    TextField("New Username", text: $username)
                                }
                                .navigationTitle("Change Username")
                            })

                            NavigationLink("Email", destination: {
                                Form {
                                    TextField("New Email", text: $emailID)
                                }
                                .navigationTitle("Change Email")
                            })

                            NavigationLink("Password", destination: {
                                Form {
                                    SecureField("New Password", text: $password)
                                }
                                .navigationTitle("Change Password")
                            })
                        }

                        NavigationLink("Redeem History", destination: {
                            Form {
                                ForEach(historyList, id: \.self) {
                                    Text($0)
                                }
                                .navigationTitle("Redeem History")
                            }
                        })
                    }
                }
                .padding()
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
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
