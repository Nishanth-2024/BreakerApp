//
//  SettingsView.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 08/10/24.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        TabView {
            Tab("Timings", systemImage: "gearshape.2") {
                TimingsView()
            }
        }
        .tint(Color.tabTint)
        .frame(width: 480)
    }
}

#Preview {
    SettingsView()
}
