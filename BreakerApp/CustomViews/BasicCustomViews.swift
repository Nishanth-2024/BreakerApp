//
//  BasicCustomViews.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 06/10/24.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var value: Double
    
    var body: some View {
        TextField(placeholder, value: $value, formatter: NumberFormatter())
            .padding(12)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .font(.headline)
            .labelsHidden()
            .textFieldStyle(.plain)
    }
}

struct CircularProgressView: View {
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundStyle(Color.breakMessage)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundStyle(Color.breakMessage)
                .rotationEffect(Angle(degrees: 270.0))
        }
    }
}
