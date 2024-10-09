//
//  ContentView.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 05/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var workTime: Double = 2 // Test default
    @State private var breakTime: Double = 4 // Test default
    @State private var showBlurView: Bool = false
    @State private var blurWindow: NSWindow?
    @State private var isRunning: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            CustomTimePicker(title: "Break Frequency", value: $workTime)
            CustomTimePicker(title: "Break Duration", value: $breakTime)
            
            Button {
                startStopAction()
                NSApp.hide(nil)
            } label: {
                Label {
                    Text(isRunning ? "Stop" : "Start")
                } icon: {
                    Image(systemName: "figure.run")
                }
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .foregroundStyle(Color.startButtonText)
            .background(isRunning ? Color.stopButton : Color.startButton)
            .cornerRadius(4)
        }
        .padding()
        .onChange(of: showBlurView) { handleBlurViewChange($0, $1) }
    }
    
    private func startStopAction() {
        DispatchQueue.main.async {
            let shouldRun  = !isRunning
            isRunning.toggle()
            if (shouldRun) {
                startWorkCycle()
            } else {
                showBlurView = false
            }
        }
    }
    
    private func startWorkCycle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + workTime) {
            if isRunning {
                showBlurView = true
            }
        }
    }
    
    private func handleBlurViewChange(_ oldValue: Bool, _ newValue: Bool) {
        if newValue {
            DispatchQueue.main.async {
                showFullScreenBlurView()
            }
        } else {
            hideFullScreenBlurView()
        }
    }
    
    private func showFullScreenBlurView() {
        printWithDateTime("Attempting to show FullScreenBlurView")
        if let screen = NSScreen.main {
            let hostingRootView = FullScreenBlurView(breakDuration: breakTime, onDismiss: handleBlurDismiss)
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
    
    private func configureWindow(_ window: NSWindow, with contentViewController: NSHostingController<FullScreenBlurView>, screen: NSScreen) {
        window.contentViewController = contentViewController
        window.setFrame(screen.frame, display: true)
        window.styleMask = [.borderless, .fullSizeContentView]
        window.level = .popUpMenu
        window.setAccessibilityRole(.popover)
        window.isOpaque = true
        window.hasShadow = false
        window.backgroundColor = .clear
        window.collectionBehavior = [.stationary, .ignoresCycle, .fullScreenDisallowsTiling, .canJoinAllSpaces, .canJoinAllApplications]
        window.makeKeyAndOrderFront(nil)
        window.orderFrontRegardless()
        window.layoutIfNeeded()
    }
    
    private func handleBlurDismiss(stop: Bool = false) {
        if stop {
            showBlurView = false
            isRunning = false
        } else {
            showBlurView = false
            startWorkCycle()
        }
    }
    
    private func hideFullScreenBlurView() {
        if let window = blurWindow {
            window.orderOut(nil)
            window.contentViewController = nil
            NSApp.presentationOptions = []
        }
    }
}

#Preview {
    ContentView()
}
