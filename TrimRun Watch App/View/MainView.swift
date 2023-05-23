//
//  MainView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI
import WatchKit

struct MainView: View {
    @ObservedObject var heartRateMonitor: HeartRateMonitor = HeartRateMonitor()
    @State var timeRemaining: Int
    
    var body: some View {
        NavigationView {
            VStack {
                HeartRateView(heartRate: heartRateMonitor.value, indicatorType: getIndicatorType(heartRate: heartRateMonitor.value))
                TimeLeftView(timeRemaining: timeRemaining)
                IndicatorCardView(indicatorType: getIndicatorType(heartRate: heartRateMonitor.value))
            }
            .padding(.top, 20)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(heartRateMonitor: HeartRateMonitor(), timeRemaining: 10)
    }
}
