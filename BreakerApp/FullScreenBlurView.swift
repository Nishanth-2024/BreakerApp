import SwiftUI
import Combine

struct FullScreenBlurView: View {
    var breakDuration: Double
    var onDismiss: (_ stop: Bool) -> Void
    @State private var timeRemaining: Int
    @State private var timerCancellable: AnyCancellable?
    
    init(breakDuration: Double, onDismiss: @escaping (_ stop: Bool) -> Void) {
        self.breakDuration = breakDuration
        self.onDismiss = onDismiss
        self._timeRemaining = State(initialValue: Int(breakDuration))
        self.timerCancellable = nil
    }
    
    func getDesktopBackground() -> Image {
        let workspace = NSWorkspace.shared
        let screen = NSScreen.main
        let desktopURL = workspace.desktopImageURL(for: screen!)!
        if let dkimage = NSImage(contentsOf: desktopURL) {
            // TODO: No permissions requested yet
            return Image(nsImage: dkimage)
        }
        return Image(.restModeBackground)
    }
    
    var body: some View {
        ZStack {
            Image(.restModeBackground)
                .resizable()
                .scaledToFill()
                .blur(radius: 32, opaque: true)
            VStack {
                Spacer()
                Text("Brief Intermission")
                    .font(FontConstants.BlurViewTitleFont)
                    .foregroundStyle(Color.breakMessage)
                    .padding()
                Text("Look far away at a distant object to rest your eyes")
                    .font(FontConstants.BlurViewSubtitleFont)
                    .foregroundStyle(Color.breakMessage1)
                    .padding()
                Divider()
                    .frame(width: 320, height: 2)
                    .background(Color.breakDivider)
                    .padding()
                Spacer()
                ZStack {
                    Circle()
                        .stroke(lineWidth: 9)
                        .opacity(0.3)
                        .foregroundStyle(Color.breakMessage1)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(Double(timeRemaining) / breakDuration, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(Color.breakTimer)
                        .rotationEffect(Angle(degrees: 270.0))
                    
                    Text(timeString(time: timeRemaining))
                        .font(FontConstants.BlurViewTimeFont)
                        .foregroundStyle(Color.breakTimer)
                        .animation(.easeInOut(duration: 0.1825), value: timeRemaining)
                }
                .frame(width: 196, height: 196)
                .padding()
                Spacer()
                HStack {
                    Button(action: { closeOverlay() }, label: {
                        Label {
                            Text("Skip")
                                .font(FontConstants.BlurViewButtonTextFont)
                        } icon: {
                            Image(systemName: "eject")
                                .font(FontConstants.BlurViewButtonIconFont)
                        }
                        .foregroundColor(Color.breakSkipButton)
                    })
                    .buttonStyle(TransparentButtonStyle(color: .breakSkipButton))
                    
                    Spacer().frame(width: 32)
                    
                    // TODO: YET TO IMPLEMENT
                    Button(action: { closeOverlay() }, label: {
                        Label {
                            Text("Snooze")
                                .font(FontConstants.BlurViewButtonTextFont)
                        } icon: {
                            Image(systemName: "clock.arrow.circlepath")
                                .font(FontConstants.BlurViewButtonIconFont)
                        }
                        .foregroundColor(Color.breakSnoozeButton)
                    })
                    .buttonStyle(TransparentButtonStyle(color: .breakSnoozeButton.opacity(0.375)))
                    .disabled(true)
                    .opacity(0.375)
                    
                    Spacer().frame(width: 32)
                    
                    Button(action: { closeOverlay(true) }, label: {
                        Label {
                            Text("Stop")
                                .font(FontConstants.BlurViewButtonTextFont)
                        } icon: {
                            Image(systemName: "exclamationmark.octagon")
                                .font(FontConstants.BlurViewButtonIconFont)
                        }
                        .foregroundColor(Color.breakStopButton)
                    })
                    .buttonStyle(TransparentButtonStyle(color: Color.breakStopButton))
                }
                .padding(20)
                Spacer()
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            startBreakTimer()
        }
    }
    
    func startBreakTimer() {
        timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                withAnimation(.linear(duration: 1)) {
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        self.closeOverlay()
                    }
                }
            }
    }
    
    func closeOverlay(_ stop: Bool = false) {
        DispatchQueue.main.async {
            guard self.timerCancellable != nil else { return }
            self.timerCancellable?.cancel()
            self.timerCancellable = nil
            self.onDismiss(stop)
        }
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    FullScreenBlurView(breakDuration: 60) {stop in }.frame(width: 1000, height: 750)
}
