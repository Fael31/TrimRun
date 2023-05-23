//
//  SetTimeView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct SetTimeView: View {
    @State var time: Int = 10
    var body: some View {
        NavigationView {
            NavigationLink {
                MainView(timeRemaining: time)
            } label: {
                Text("Set Timer")
            }
        }
        .navigationTitle("Set Timer")
    }
}

struct SetTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SetTimeView()
    }
}
