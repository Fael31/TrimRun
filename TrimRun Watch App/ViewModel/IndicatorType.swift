//
//  IndicatorType.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

enum IndicatorType: String {
    case low = "Low"
    case good = "Good"
    case high = "High"
    
    var title: String {
        return self.rawValue
    }
    
    var description: String {
        switch self {
        case .low:
            return "Faster your running !"
        case .good:
            return "Keep this tempo !"
        case .high:
            return "Slow it down !"
        }
    }
}

func getIndicatorColor(indicator: IndicatorType) -> Color {
    switch indicator {
    case .low:
        return Color("Blue")
    case .good:
        return Color("Green")
    case .high:
        return Color("Red")
    }
}

func getIndicatorType(heartRate: Int, age: Int = 21) -> IndicatorType {
    /*
     formula of ideal heart rate while running = 60% - 70% of Maximum Heart Rate (MHR)
     formula of MHR = 220 - age
    */
    let minimum = Int(0.6 * Double(220 - age))
    let maximum = Int(0.7 * Double(220 - age))
    if (heartRate < minimum) {
        return .low
    } else if (heartRate < maximum) {
        return .good
    } else {
        return .high
    }
}
