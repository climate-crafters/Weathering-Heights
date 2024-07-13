//
//  SettingsView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 10/07/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("sound") private var shouldPlaySound: Bool = true

    @AppStorage("updates") private var forecastUpdates: String = "Hourly"
    @AppStorage("temperature") private var temperatureUnit: String = "Celsius"
    @AppStorage("distance") private var distanceUnit: String = "Kilometers"
    @AppStorage("alert") private var shouldAlert: Bool = true

    @AppStorage("color") private var colorFilter: String = "None"
    @AppStorage("contrast") private var isHighContrast: Bool = false
    @AppStorage("motion") private var shouldReduceMotion: Bool = false
    @AppStorage("read") private var shouldScreenRead: Bool = false

    let updateOptions = ["Hourly", "Daily"]
    let temperatureOptions = ["Celsius", "Fahrenheit"]
    let distanceOptions = ["Kilometers", "Miles"]
    let colorOptions = ["None", "Protanopia", "Deuteranopia", "Tritanopia"]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("General")) {
                    NavigationLink("Profile Settings", destination: Profile().navigationBarBackButtonHidden(true))
                    Toggle("Ambient Sounds", isOn: $shouldPlaySound)
                }

                Section(header: Text("Weather")) {
                    Picker("Forecast Updates", selection: $forecastUpdates) {
                        ForEach(updateOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Temperature Unit", selection: $temperatureUnit) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Distance Unit", selection: $distanceUnit) {
                        ForEach(distanceOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Toggle("Severe Weather Alerts", isOn: $shouldAlert)
                }

                Section(header: Text("Accessibility")) {
                    Picker("Colorblind Filter", selection: $colorFilter) {
                        ForEach(colorOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Toggle("High Contrast", isOn: $isHighContrast)
                    Toggle("Reduced Motion", isOn: $shouldReduceMotion)
                    Toggle("Screen Reader", isOn: $shouldScreenRead)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
