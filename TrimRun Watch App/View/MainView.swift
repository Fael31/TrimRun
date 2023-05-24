//
//  MainView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var heartRateMonitor = HeartRateMonitor()
    @State var timeRemaining: Int
    @Binding var isShowingMainView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                HeartRateView(heartRate: heartRateMonitor.value, indicatorType: getIndicatorType(heartRate: heartRateMonitor.value))
                TimeLeftView(timeRemaining: timeRemaining, isShowingMainView: $isShowingMainView)
                IndicatorCardView(indicatorType: getIndicatorType(heartRate: heartRateMonitor.value))
            }
            .padding(.top, 20)
        }
        .navigationTitle("Set Timer")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(heartRateMonitor: HeartRateMonitor(), timeRemaining: 10, isShowingMainView: .constant(true))
    }
}
