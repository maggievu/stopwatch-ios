//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Maggie VU on 2019-01-14.
//  Copyright © 2019 Maggie VU. All rights reserved.
//

import Foundation

class Stopwatch {
    private var startTime: Date?
    private var resumeTime: Double = 0.0
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime { // if self.startTime != nil
            return resumeTime + -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        if !isRunning {
            startTime = Date()
        }
    }
    
    func stop() {
//        This is to calculate the original starting time
//        resumeTime = Date().addingTimeInterval(-elapsedTime)
        resumeTime = elapsedTime
        startTime = nil
    }
    
//    func resume() { // Resume and Start buttons can become one
//        if !isRunning {
//            startTime = Date()
//        }
//    }
    
    func reset() {
        startTime = nil
        resumeTime = 0
    }
    
    
}
