//
//  Constants.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 06/10/24.
//

import SwiftUI

struct FontConstants {
    static let BlurViewTitleFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 48, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewSubtitleFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 28, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewTimerFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 32, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewButtonFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewButtonTextFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewButtonIconFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let BlurViewTimeFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 48, weight: .semibold, design: .rounded)
    }()
    
    
    static let ConfigViewTitleFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 30, weight: .semibold, design: .rounded)
    }()
    
    static let ConfigViewButtonFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let ConfigViewButtonTextFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let ConfigViewButtonIconFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 21, weight: .semibold, design: .rounded)
    }()
    
    static let TimePickerTitleFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 24, weight: .semibold, design: .rounded)
    }()
    
    static let TimePickerLabelFont: Font = {
        return customOrSystemFont(name: "Helvetica Neue", size: 15, weight: .semibold, design: .rounded)
    }()
    
    private static func customOrSystemFont(name: String, size: CGFloat, weight: Font.Weight, design: Font.Design) -> Font {
        if NSFont(name: name, size: size) != nil {
            return Font.custom(name, size: size).weight(weight).monospacedDigit()
        } else {
            return Font.system(size: size, weight: weight, design: design)
        }
    }
}

