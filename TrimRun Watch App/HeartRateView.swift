//
//  HeartRateView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 19/05/23.
//

import SwiftUI

struct HeartRateView: View {
    var body: some View {
        HStack {
            Text("103")
                .bold()
            VStack {
                Text("BPM")
                Image(systemName: "heart.fill")
            }
        }
    }
}

struct HeartRateView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateView()
    }
}
