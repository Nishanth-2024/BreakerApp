//
//  CustomExtensions.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 20/10/24.
//

import SwiftUI

extension Color {
    static var magenta: Color {
        return Color(red: 1.0, green: 0.0, blue: 1.0)
    }

    static var lime: Color {
        return Color(red: 0.0, green: 1.0, blue: 0.0)
    }
    
    static func random() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
