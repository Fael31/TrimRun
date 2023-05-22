//
//  IndicatorCardView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct IndicatorCardView: View {
    var indicatorType: IndicatorType
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(indicatorType.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                Spacer()
            }
            Spacer()
            Text(indicatorType.description)
                .foregroundColor(.black)
                .font(.system(size: 14))
            Spacer()
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .frame(width: 170, height: 51)
        .background(getIndicatorColor(indicator: indicatorType))
        .cornerRadius(10)
        
    }
}

struct IndicatorCardView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorCardView(indicatorType: .good)
    }
}
