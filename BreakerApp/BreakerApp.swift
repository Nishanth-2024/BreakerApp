//
//  BreakerAppApp.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 05/10/24.
//

import SwiftUI
import AppKit

@main
struct BreakerApp: App {
    
    @Environment(\.openSettings) private var openSettings
    @State private var appState = TimingsLogic.appState
    
    init() {
        TimingsLogic.initialize()
    }
    
    var body: some Scene {
        MenuBarExtra {
            Divider()
            Button {
                TimingsLogic.toggleEnableDisable()
            } label: {
                Label {
                    Text(appState.isRunning ? "Disable" : "Enable")
                } icon: {
                    Image(systemName: appState.isRunning ? "pause.circle.fill" : "play.circle.fill")
                }
            }
            Divider()
            Button("Settings") {
                openSettings()
                NSApp.arrangeInFront(nil)
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        } label: {
            Image(systemName: "swirl.circle.righthalf.filled.inverse")
        }
        Settings {
            SettingsView()
        }
    }
}
