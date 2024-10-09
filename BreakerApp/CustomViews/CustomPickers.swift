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
                .padding(.bottom, 8)
                .padding(.leading, 4)
            HStack {
                Picker(selection: $hours, label: Text(" Hours ")) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
                
                Picker(selection: $minutes, label: Text("Minutes")) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)").tag(minute)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
                
                Picker(selection: $seconds, label: Text("Seconds")) {
                    ForEach(0..<60) { second in
                        Text("\(second)").tag(second)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .clipped()
            }
            .padding()
            .font(FontConstants.TimePickerLabelFont)
            .background(Color.settingPickerControlBg)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.settingPickerControlBorder, lineWidth: 1)
            )
            .onChange(of: hours, { oldValue, newValue in updateValue() })
            .onChange(of: minutes) { oldValue, newValue in updateValue() }
            .onChange(of: seconds, { oldValue, newValue in updateValue() })
            .onAppear {
                let totalSeconds = Int(value)
                hours = totalSeconds / 3600
                minutes = (totalSeconds % 3600) / 60
                seconds = totalSeconds % 60
            }
        }
        .foregroundColor(Color.settingPickerLabel)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    private func updateValue() {
        value = Double(hours * 3600 + minutes * 60 + seconds)
    }
}

struct CustomTimePicker2: View {
    var title: String
    @Binding var value: Double
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(FontConstants.TimePickerTitleFont)
                .padding(.leading)
                .padding(.top, 6)
            Divider()
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
            .padding()
            .onChange(of: hours, { oldValue, newValue in updateValue() })
            .onChange(of: minutes) { oldValue, newValue in updateValue() }
            .onChange(of: seconds, { oldValue, newValue in updateValue() })
            .onAppear {
                let totalSeconds = Int(value)
                hours = totalSeconds / 3600
                minutes = (totalSeconds % 3600) / 60
                seconds = totalSeconds % 60
            }
        }
        .foregroundColor(Color.settingPickerLabel)
        .background(Color.settingPickerControlBg)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.settingPickerControlBorder, lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    private func updateValue() {
        value = Double(hours * 3600 + minutes * 60 + seconds)
    }
}

#Preview {
    let customDivider = Divider()
        .frame(height: 4)
        .background(.clear)
        .foregroundStyle(.clear)
        .padding(.horizontal)
        .padding(.horizontal)
        .padding()
    VStack {
        Spacer()
        CustomTimePicker(title: "Select Time", value: .constant(0))
        CustomTimePicker(title: "Select Time", value: .constant(0))
        customDivider
        CustomTimePicker2(title: "Select Time", value: .constant(0))
        CustomTimePicker2(title: "Select Time", value: .constant(0))
        customDivider
        CustomTimePicker(title: "Select Time", value: .constant(0))
        CustomTimePicker2(title: "Select Time", value: .constant(0))
        customDivider
        CustomTimePicker2(title: "Select Time", value: .constant(0))
        CustomTimePicker(title: "Select Time", value: .constant(0))
        Spacer()
    }
    .frame(width: 480, height: 1020)
}
