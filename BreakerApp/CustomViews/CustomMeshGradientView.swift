//
//  CustomMeshGradientView.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 20/10/24.
//

import SwiftUI

struct CustomMeshGradientView: View {
    var meshGradient: MeshGradient
    
    var body: some View {
        meshGradient
            .edgesIgnoringSafeArea(.all)
    }
}

struct CustomAnimatingMeshGradientView: View {
    @State var isAnimating = false
    
    var body: some View {
        MeshGradient(width: 3, height: 3, points: [
            [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
            [0.0, 0.5], [isAnimating ? 0.1 : 0.8, 0.5], [1.0, isAnimating ? 0.5 : 1],
            [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
        ], colors: [
            .purple, .indigo, .purple,
            isAnimating ? .mint : .purple, .blue, .blue,
            .purple, .indigo, .purple
        ])
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    // CustomMeshGradientView(meshGradient: SampleMeshGradients.linearGradientMesh).frame(width: 300, height: 300)
    // CustomMeshGradientView(meshGradient: SampleMeshGradients.angularGradientMesh).frame(width: 300, height: 300)
    CustomMeshGradientView(meshGradient: SampleMeshGradients.radialGradientMesh).frame(width: 300, height: 300)
}
