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
    
    var body: some Scene {
        MenuBarExtra {
            Divider()
            // if #available(macOS 14.0, *) {
            //     SettingsLink {
            //         Text("Settings")
            //     }
            // } else {
            //     Button("Settings from NSApp") {
            //         NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
            //     }
            // }
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
