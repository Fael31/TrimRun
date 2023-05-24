//
//  TimeLeftView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct TimeLeftView: View {
    @State var timeRemaining: Int
    @Binding var isShowingMainView: Bool
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Text("Time Left :")
                .font(.system(size: 13))
            Spacer()
            TimeRemainingView()
                .font(.system(size: 20))
                .bold()
        }
        .padding(.horizontal, 16)
    }
    
    func TimeRemainingView() -> some View {
        Text(secondsToString(time: timeRemaining))
            .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                isShowingMainView = false
                            }
                        }
    }
    
    func secondsToString(time: Int) -> String {
        let minutes: Int = time / 60
        let seconds: Int = time % 60
        return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
}

//struct TimeLeftView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeLeftView(timeRemaining: 300)
//    }
//}
