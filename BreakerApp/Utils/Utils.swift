//
//  Utils.swift
//  BreakerApp
//
//  Created by VEMULA Nishanth on 08/10/24.
//

import Foundation

func printWithDateTime(_ anyInput: Any) {
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateString = dateFormatter.string(from: currentDate)
    
    print(dateString)
    print(anyInput)
}
