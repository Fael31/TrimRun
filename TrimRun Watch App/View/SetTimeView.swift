//
//  SetTimeView.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 22/05/23.
//

import SwiftUI

struct SetTimeView: View {
    @State private var selectedMinutes = 15
    @State var isShowingMainView = false
    @ObservedObject var heartRateMonitor = HeartRateMonitor()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if (!isShowingMainView) {
                    stopHeartRateMonitor().opacity(0)
                }
                VStack {
                    Picker(
                        selection: $selectedMinutes,
                        label:
                            VStack {
                                Text("Select Timer")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .padding(2.5)
                            }
                            .background(Color("Green Timer"))
                            .cornerRadius(4)
                            .offset(y: 4)
                    ) {
                        ForEach(1..<61) { minute in
                            Text("\(minute) min")
                                .tag(minute)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 105)
                    
                    Button(action: {
                        isShowingMainView = true
                        heartRateMonitor.start()
                    }, label: {
                        Text("Set Timer")
                    }).padding(.top, 10)

                }
                .padding(.top, 20)
                .navigationTitle("TrimRun")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(isPresented: $isShowingMainView) {
                    MainView(heartRateMonitor: heartRateMonitor, timeRemaining: (selectedMinutes * 60), isShowingMainView: $isShowingMainView)
            }
            }
        }
    }
    
    func stopHeartRateMonitor() -> some View {
        heartRateMonitor.stop()
        
        return EmptyView()
    }
}

struct SetTimeView_Previews: PreviewProvider {
    static var previews: some View {
        SetTimeView()
    }
}
