//
//  CustomViews.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 06/10/24.
//

import SwiftUI

struct CustomTimePicker: View {
    var title: String
    @Binding var value: Double
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(FontConstants.TimePickerTitleFont)
                .padding(.horizontal, 20)
            HStack {
                Picker(selection: $hours, label: Text("Hours").font(FontConstants.TimePickerLabelFont)) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
                
                Picker(selection: $minutes, label: Text("Minutes").font(FontConstants.TimePickerLabelFont)) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)").tag(minute)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
                
                Picker(selection: $seconds, label: Text("Seconds").font(FontConstants.TimePickerLabelFont)) {
                    ForEach(0..<60) { second in
                        Text("\(second)").tag(second)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
            }
            .foregroundColor(Color.settingPickerLabel)
            .onChange(of: hours, { oldValue, newValue in updateValue() })
            .onChange(of: minutes) { oldValue, newValue in updateValue() }
            .onChange(of: seconds, { oldValue, newValue in updateValue() })
            .padding()
            .background(Color.settingPickerControlBg)
            .cornerRadius(10)
            .padding(.horizontal,20)
            .font(.headline)
            .onAppear {
                let totalSeconds = Int(value)
                hours = totalSeconds / 3600
                minutes = (totalSeconds % 3600) / 60
                seconds = totalSeconds % 60
            }
        }
        .padding(5)
    }
    
    private func updateValue() {
        value = Double(hours * 3600 + minutes * 60 + seconds)
    }
}

#Preview {
    VStack {
        Spacer()
        CustomTimePicker(title: "Select Time", value: .constant(0))
        Spacer()
    }
    .frame(maxWidth: 480)
//    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
//        .edgesIgnoringSafeArea(.all))
}
