//
//  TimingsView.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 25/10/24.
//

import SwiftUI

struct TimingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var breakFrequency: Double = TimingsLogic.frequency
    @State private var breakDuration: Double = TimingsLogic.duration
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                CustomTimePicker(title: "Break Frequency", value: $breakFrequency)
                CustomTimePicker(title: "Break Duration", value: $breakDuration)
                Button {
                    saveAction()
                } label: {
                    Label {
                        Text("Save")
                    } icon: {
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                    }
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .foregroundStyle(Color.startButtonText)
                .background(Color.startButton)
                .cornerRadius(4)
            }
            .padding()
            if showAlert {
                Color.black.opacity(0.375)
                    .blur(radius: 8)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Error")
                        .font(FontConstants.ErrorTitle)
                    Divider()
                        .frame(width: 256)
                    Text("Failed to save the configuration. Please try again.")
                        .font(FontConstants.ErrorMessage)
                        .padding()
                    Button {
                        DispatchQueue.main.async {
                            showAlert = false
                        }
                    } label: {
                        Label {
                            Text("Dismiss")
                        } icon: {
                            Image(systemName: "xmark")
                                .bold()
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .foregroundStyle(Color.startButtonText)
                    .background(Color.startButton)
                    .cornerRadius(4)
                }
                .frame(width: 320, height: 144)
                .background()
                .cornerRadius(12)
                .shadow(radius: 20)
            }
        }
    }
    
    private func saveAction() {
        do {
            let encoded = try JSONEncoder().encode(BreakConfig(Frequency: breakFrequency, Duration: breakDuration))
            UserDefaults.standard.set(encoded, forKey: FunctionalConstants.BreakConfigKey)
            TimingsLogic.updateTimings(frequency: breakFrequency, duration: breakDuration)
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Failed to encode BreakConfig: \(error.localizedDescription)")
            // Handle the error appropriately, e.g., show an alert to the user
            DispatchQueue.main.async {
                showAlert = true
            }
        }
    }
}

#Preview {
    TimingsView()
}
