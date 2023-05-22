//
//  HeartRateView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 19/05/23.
//

import SwiftUI

struct HeartRateView: View {
    var heartRate: Int
    var indicatorType: IndicatorType
    
    var body: some View {
        HStack {
            Text("\(heartRate)")
                .font(.system(size: 70))
                .foregroundColor(getIndicatorColor(indicator: indicatorType))
                .bold()
            VStack {
                Text("BPM")
                    .font(.system(size: 20))
                    .foregroundColor(getIndicatorColor(indicator: indicatorType))
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 30, height: 25)
                    .foregroundColor(getIndicatorColor(indicator: indicatorType))
            }
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView(heartRate: 103, indicatorType: .good)
    }
}
