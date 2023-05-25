//
//  HapticFeedback.swift
//  TrimRun Watch App
//
//  Created by Muhammad Fauzul Akbar on 23/05/23.
//

import Foundation
import WatchKit

class HapticFeedback: ObservableObject {
    @Published var heartRateMonitor: HeartRateMonitor
    private var currentIndicatorType: IndicatorType = .good
    private var timer: Timer?
    
    init(heartRateMonitor: HeartRateMonitor) {
        self.heartRateMonitor = heartRateMonitor
    }
    
    func start() {
        let indicatorType: IndicatorType = getIndicatorType(heartRate: heartRateMonitor.value)
        if(indicatorType != currentIndicatorType) {
            currentIndicatorType = indicatorType;
            if(currentIndicatorType != .good) {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }
    
    func stop() {
        currentIndicatorType = .good
        stopTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            self.triggerHapticFeedback()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func triggerHapticFeedback() {
        for _ in 1...500 {
            WKInterfaceDevice.current().play(.failure) // Use a specific haptic feedback type
        }
    }
}
