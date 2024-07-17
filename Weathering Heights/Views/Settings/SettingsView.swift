//
//  SettingsView.swift
//  Weathering Heights
//
//  Created by Jayanth R on 10/07/2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("shouldPlaySound") private var shouldPlaySound: Bool = true

    @AppStorage("temperatureUnit") private var temperatureUnit: String = "°C"
    @AppStorage("windUnit") private var windUnit: String = "km/h"
    @AppStorage("precipitationUnit") private var precipitationUnit: String = "mm, cm"
    @AppStorage("pressureUnit") private var pressureUnit: String = "hPa"
    @AppStorage("distanceUnit") private var distanceUnit: String = "km"
    @AppStorage("shouldAlert") private var shouldAlert: Bool = true

    let temperatureOptions = ["°C", "°F"]
    let windOptions = ["mph", "km/h", "m/s", "bft", "kn"]
    let precipitationOptions = ["in", "mm, cm"]
    let pressureOptions = ["mbar", "inHg", "mmHg", "hPa", "kPa"]
    let distanceOptions = ["mi", "km"]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("General")) {
                    NavigationLink("Profile", destination: Profile())
                    Toggle("Ambient Sounds", isOn: $shouldPlaySound)
                }

                Section(header: Text("Weather")) {
                    Picker("Temperature Unit", selection: $temperatureUnit) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Wind Unit", selection: $windUnit) {
                        ForEach(windOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Precipitation Unit", selection: $precipitationUnit) {
                        ForEach(precipitationOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)

                    Picker("Pressure Unit", selection: $pressureUnit) {
                        ForEach(pressureOptions, id: \.self) {
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
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
