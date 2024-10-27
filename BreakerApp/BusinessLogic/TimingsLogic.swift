//
//  TimingsLogic.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 25/10/24.
//

import Foundation
import SwiftUI

import Combine

@Observable
class AppState {
    var isRunning: Bool = false
}

struct TimingsLogic {
    
    public static func initialize() {
        if let savedData = UserDefaults.standard.data(forKey: FunctionalConstants.BreakConfigKey),
           let breakConfig = try? JSONDecoder().decode(BreakConfig.self, from: savedData) {
            TimingsLogic.frequency = breakConfig.Frequency
            TimingsLogic.duration = breakConfig.Duration
        } else {
            TimingsLogic.frequency = 4
            TimingsLogic.duration = 4
            let defaultConfig = BreakConfig(Frequency: 4, Duration: 4)
            if let encoded = try? JSONEncoder().encode(defaultConfig) {
                UserDefaults.standard.set(encoded, forKey: FunctionalConstants.BreakConfigKey)
            }
        }

    }
    
    public static func updateTimings(frequency: Double, duration: Double) {
        self.frequency = frequency
        self.duration = duration
    }
    
    private(set) static var frequency: Double = 4
    private(set) static var duration: Double = 4
    private static var blurWindow: NSWindow?
    private(set) static var appState = AppState()
    
    public static func startBreakTiming(frequency: Double, duration: Double) {
        TimingsLogic.duration = duration
        TimingsLogic.frequency = frequency
        startWorkCycle()
    }
    
    private static func startWorkCycle() {
        guard frequency > 0 else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + frequency) {
            showBlurView()
        }
    }
    
    private static func showBlurView() {
        printWithDateTime("Attempting to show FullScreenBlurView")
        guard duration > 0 else { return }
        if let screen = NSScreen.main {
            let hostingRootView = FullScreenBlurView(breakDuration: duration, onDismiss: handleBlurDismiss)
            let fullscreenBlurView = NSHostingController(rootView: hostingRootView)
            if blurWindow == nil {
                let window = NSWindow(contentViewController: fullscreenBlurView)
                configureWindow(window, with: fullscreenBlurView, screen: screen)
                blurWindow = window
            }
            if let window = blurWindow {
                configureWindow(window, with: fullscreenBlurView, screen: screen)
                printWithDateTime("FullScreenBlurView shown")
            }
        }
    }
    
    private static func configureWindow(_ window: NSWindow, with contentViewController: NSHostingController<FullScreenBlurView>, screen: NSScreen) {
        window.contentViewController = contentViewController
        window.setFrame(screen.frame, display: true)
        window.styleMask = [.borderless, .fullSizeContentView]
        window.level = .popUpMenu
        window.setAccessibilityRole(.popover)
        window.isOpaque = true
        window.hasShadow = false
        window.backgroundColor = .clear
        window.collectionBehavior = [.stationary, .ignoresCycle, .fullScreenDisallowsTiling, .canJoinAllSpaces, .canJoinAllApplications]
        // window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        window.layoutIfNeeded()
    }
    
    private static func handleBlurDismiss(stop: Bool = false) {
        printWithDateTime("FullScreenBlurView dismissed")
        blurWindow?.close()
        if stop {
            appState.isRunning.toggle()
        } else {
            startWorkCycle()
        }
    }
    
    public static func toggleEnableDisable() {
        if appState.isRunning {
            blurWindow?.close()
        } else {
            TimingsLogic.startBreakTiming(frequency: TimingsLogic.frequency, duration: TimingsLogic.duration)
        }
        appState.isRunning.toggle()
    }
}
