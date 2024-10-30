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
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                CustomTimePicker(title: "Break Frequency", systemName: "play.circle", value: $breakFrequency)
                CustomTimePicker(title: "Break Duration", systemName: "cricket.ball", value: $breakDuration)
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
                Color.alertBg
                    .blur(radius: 10)
                    // .padding()
                    // .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Error")
                        .font(FontConstants.ErrorTitle)
                    Divider()
                        .frame(width: 256)
                    Text(errorMessage)
                        .font(FontConstants.ErrorMessage)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Button {
                        DispatchQueue.main.async {
                            showAlert = false
                            errorMessage = ""
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
            try TimingsLogic.updateTimings(frequency: breakFrequency, duration: breakDuration)
            presentationMode.wrappedValue.dismiss()
        } catch TimingsError.invalidFrequency {
            errorMessage = "Invalid frequency value provided."
            DispatchQueue.main.async {
                showAlert = true
            }
        } catch TimingsError.invalidDuration {
            errorMessage = "Invalid duration value provided."
            DispatchQueue.main.async {
                showAlert = true
            }
        } catch TimingsError.encodingFailed(let error) {
            errorMessage = "Failed to encode BreakConfig: \(error.localizedDescription)"
            DispatchQueue.main.async {
                showAlert = true
            }
        } catch {
            errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
            DispatchQueue.main.async {
                showAlert = true
            }
        }
    }
}

#Preview {
    TimingsView()
}
