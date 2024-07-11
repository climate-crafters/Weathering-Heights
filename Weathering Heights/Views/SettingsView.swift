//
//  SettingsView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 10/07/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var shouldPlaySound: Bool = true

    @State private var forecastUpdates: String = "Hourly"
    @State private var temperatureUnit: String = "Celsius"
    @State private var distanceUnit: String = "Kilometers"
    @State private var shouldAlert: Bool = true

    @State private var colorFilter: String = "None"
    @State private var isHighContrast: Bool = false
    @State private var isReduceMotion: Bool = false
    @State private var isScreenRead: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("General")) {
                    NavigationLink("Profile Settings", destination: Profile())
                    Toggle("Ambient Sounds", isOn: $shouldPlaySound)
                }

                Section(header: Text("Weather")) {
                    Picker("Forecast Updates", selection: $forecastUpdates) {
                        Text("Hourly")
                        Text("Daily")
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Temperature Unit", selection: $temperatureUnit) {
                        Text("Celsius")
                        Text("Fahrenheit")
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Distance Unit", selection: $distanceUnit) {
                        Text("Kilometers")
                        Text("Miles")
                    }
                    .pickerStyle(.navigationLink)

                    Toggle("Severe Weather Alerts", isOn: $shouldAlert)
                }

                Section(header: Text("Accessibility")) {
                    Picker("Colorblind Filter", selection: $colorFilter) {
                        Text("None")
                        Text("Protanopia")
                        Text("Deuteranopia")
                        Text("Tritanopia")
                    }
                    .pickerStyle(.navigationLink)

                    Toggle("High Contrast", isOn: $isHighContrast)
                    Toggle("Reduced Motion", isOn: $isReduceMotion)
                    Toggle("Screen Reader", isOn: $isScreenRead)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
