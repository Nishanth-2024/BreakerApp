//
//  ButtonStyles.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 06/10/24.
//

import SwiftUI

struct InvertedPrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    Color.blue.opacity(0.875)
                    InvertedBlurView(radius: 6)
                        .mask(
                            RoundedRectangle(cornerRadius: 32)
                                .padding(.horizontal, -24)
                                .padding(.vertical, -12)
                        )
                }
            )
            .foregroundColor(.white.opacity(0.75))
            .cornerRadius(32)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct TransparentButtonStyle: ButtonStyle {
    var color: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(color.opacity(0.75).blur(radius: 24))
            .foregroundColor(color)
            .cornerRadius(32)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct PrimaryButtonStyle: ButtonStyle {
    var color: Color = .white

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(color.blur(radius: 12))
            .foregroundColor(.white)
            .cornerRadius(32)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

#Preview {
    VStack {
        Spacer()
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(PrimaryButtonStyle())
        
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(PrimaryButtonStyle(color: .purple))
        
        Divider().frame(width: 160, height: 4).foregroundStyle(.white)
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(TransparentButtonStyle())
        
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(TransparentButtonStyle(color: .red))
        
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(TransparentButtonStyle(color: .blue))
        
        Button(action: {}, label: {
            Label {
                Text("Start")
                    .font(FontConstants.ConfigViewButtonTextFont)
            } icon: {
                Image(systemName: "arrowshape.right.circle")
                    .font(FontConstants.ConfigViewButtonIconFont)
            }
            .foregroundColor(Color.breakSkipButton)
        })
        .buttonStyle(InvertedPrimaryButtonStyle())
        Spacer()
    }
    .frame(width: 400, height: 400)
    .background(
        MeshGradient(width: 2, height: 2, points: [
            [0, 0], [1, 0], [0, 1], [1, 1]
        ], colors: [.red, .green, .blue, .yellow])
//        LinearGradient(gradient: Gradient(colors: [Color.green, Color.purple]), startPoint: .top, endPoint: .bottom)
//        .edgesIgnoringSafeArea(.all)
    )
}
