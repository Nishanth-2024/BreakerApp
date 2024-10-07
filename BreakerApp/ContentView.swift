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
            Text("BreakerApp")
                .foregroundColor(Color.white.opacity(0.75))
                .font(FontConstants.ConfigViewTitleFont)
                .padding(.top, 40)
            CustomTimePicker(title: "Break Frequency", value: $workTime)
            CustomTimePicker(title: "Break Duration", value: $breakTime)
            Button(action: startButtonAction) {
                Label {
                    Text("Start")
                } icon: {
                    Image(systemName: "figure.run")
                }
                .foregroundColor(isRunning ? Color.accentColor : Color.white.opacity(0.625))
            }
            .font(FontConstants.ConfigViewButtonFont)
            .buttonStyle(PrimaryButtonStyle(color: .accentColor))
            .disabled(isRunning)
            .opacity(isRunning ? 0.375 : 1)
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .frame(width: 480)
        .onChange(of: showBlurView) { handleBlurViewChange($0, $1) }
    }
    
    private func startButtonAction() {
        DispatchQueue.main.async {
            isRunning = true
            startWorkCycle()
        }
        NSApp.hide(nil)
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
    
    private func handleBlurDismiss(stop: Bool) {
        DispatchQueue.main.async {
            showBlurView = false
            isRunning = !stop
        }
        if !stop {
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

func printWithDateTime(_ anyInput: Any) {
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateString = dateFormatter.string(from: currentDate)
    
    print(dateString)
    print(anyInput)
}

#Preview {
    ContentView()
}
