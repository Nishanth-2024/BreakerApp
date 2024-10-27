//
//  MeshConstants.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 20/10/24.
//

import SwiftUI

struct MeshPoints {
    static let linearPoints: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let radialPoints: [(x: Float, y: Float)] = [
        (0.5, 0.5), (0.5, 0), (1, 0.5), (0.5, 1), (0, 0.5)
    ]
    
    static let angularPoints: [(x: Float, y: Float)] = [
        (0.5, 0.5), (1, 0.5), (0.5, 1), (0, 0.5), (0.5, 0)
    ]
    
    static let complexPoints: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (1, 1), (0, 1), (0.5, 0.5)
    ]
    
    static let starPoints: [(x: Float, y: Float)] = [
        (0.5, 0), (0.6, 0.4), (1, 0.5), (0.6, 0.6), (0.5, 1), (0.4, 0.6), (0, 0.5), (0.4, 0.4)
    ]
    
    static let circularPoints: [(x: Float, y: Float)] = [
        (0.5, 0.5), (0.5, 0), (1, 0.5), (0.5, 1), (0, 0.5)
    ]
    
    static let diagonalPoints: [(x: Float, y: Float)] = [
        (0, 0), (1, 1), (1, 0), (0, 1)
    ]
    
    static let spiralPoints: [(x: Float, y: Float)] = [
        (0.5, 0.5), (0.6, 0.4), (0.7, 0.5), (0.6, 0.6), (0.5, 0.7), (0.4, 0.6), (0.3, 0.5), (0.4, 0.4)
    ]
    
    static let checkerboardPoints: [(x: Float, y: Float)] = [
        (0, 0), (0.5, 0), (1, 0), (0, 0.5), (0.5, 0.5), (1, 0.5), (0, 1), (0.5, 1), (1, 1)
    ]
    
    static let randomPoints: [(x: Float, y: Float)] = [
        (.random(in: 0...1), .random(in: 0...1)), (.random(in: 0...1), .random(in: 0...1)), (.random(in: 0...1), .random(in: 0...1)), (.random(in: 0...1), .random(in: 0...1))
    ]
    
    // Add 20 more point arrays here
    static let points11: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points12: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points13: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points14: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points15: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points16: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points17: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points18: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points19: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points20: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static let points21: [(x: Float, y: Float)] = [
        (0, 0), (1, 0), (0, 1), (1, 1)
    ]
    
    static func toCGPointArray(_ points: [(x: Float, y: Float)]) -> [CGPoint] {
        return points.map { CGPoint(x: Double($0.x), y: Double($0.y)) }
    }
    
    static func toSIMD2Array(_ points: [(x: Float, y: Float)]) -> [SIMD2<Float>] {
        return points.map { SIMD2<Float>(x: $0.x, y: $0.y) }
    }
}

struct SampleMeshGradients {
    
    static let linearGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.linearPoints),
        colors: [.red, .blue]
    )
    
    static let radialGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.radialPoints),
        colors: [.yellow, .green, .blue]
    )
    
    static let angularGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.angularPoints),
        colors: [.purple, .orange, .pink, .purple]
    )
    
    static let complexGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.complexPoints),
        colors: [.red, .green, .blue, .yellow, .purple]
    )
    
    static let starGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.starPoints),
        colors: [.cyan, .magenta, .yellow, .cyan]
    )
    
    static let circularGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.circularPoints),
        colors: [.red, .blue, .green, .yellow]
    )
    
    static let diagonalGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.diagonalPoints),
        colors: [.orange, .purple, .cyan, .orange]
    )
    
    static let spiralGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.spiralPoints),
        colors: [.blue, .green, .yellow, .red]
    )
    
    static let checkerboardGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.checkerboardPoints),
        colors: [.red, .white, .red, .white]
    )
    
    static let randomGradientMesh = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.randomPoints),
        colors: [.random(), .random(), .random(), .random()]
    )
    
    static let gradientMesh11 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points11),
        colors: [.blue, .yellow]
    )
    
    static let gradientMesh12 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points12),
        colors: [.green, .purple]
    )
    
    static let gradientMesh13 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points13),
        colors: [.orange, .blue]
    )
    
    static let gradientMesh14 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points14),
        colors: [.pink, .green]
    )
    
    static let gradientMesh15 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points15),
        colors: [.red, .cyan]
    )
    
    static let gradientMesh16 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points16),
        colors: [.yellow, .purple]
    )
    
    static let gradientMesh17 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points17),
        colors: [.blue, .orange]
    )
    
    static let gradientMesh18 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points18),
        colors: [.green, .pink]
    )
    
    static let gradientMesh19 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points19),
        colors: [.purple, .yellow]
    )
    
    static let gradientMesh20 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points20),
        colors: [.cyan, .red]
    )
    
    static let gradientMesh21 = MeshGradient(
        width: Constants.GWidth,
        height: Constants.GHeight,
        points: MeshPoints.toSIMD2Array(MeshPoints.points21),
        colors: [.magenta, .lime]
    )
}

struct Constants {
    private init() {}
    static let GWidth: Int = 3
    static let GHeight: Int = 3
}
