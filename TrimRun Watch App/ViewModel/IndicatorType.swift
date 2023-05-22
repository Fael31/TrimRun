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

func getIndicatorType(heartRate: Int) -> IndicatorType {
    if (heartRate < 90) {
        return .low
    } else if (heartRate < 120) {
        return .good
    } else {
        return .high
    }
}
