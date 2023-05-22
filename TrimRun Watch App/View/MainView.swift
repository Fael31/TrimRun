//
//  MainView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct MainView: View {
    @State var heartRate: Int = 150
    @State var timeRemaining: Int = 5
    
    var body: some View {
        VStack {
            HeartRateView(heartRate: heartRate, indicatorType: getIndicatorType(heartRate: heartRate))
            TimeLeftView(timeRemaining: $timeRemaining)
            IndicatorCardView(indicatorType: getIndicatorType(heartRate: heartRate))
        }
        .padding(.top, 20)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
