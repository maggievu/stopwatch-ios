//
//  ViewController.swift
//  Stopwatch
//
//  Created by Maggie VU on 2019-01-14.
//  Copyright © 2019 Maggie VU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var startButtonLabel: UIButton!
    
    let stopwatch = Stopwatch()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("Start tapping")
        stopwatch.start()
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop tapping")
        stopwatch.stop()
        
        if !stopwatch.isRunning && elapsedTimeLabel.text != "00:00.0" {
            startButtonLabel.setTitle("Resume", for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        stopwatch.reset()
        elapsedTimeLabel.text = "00:00.0"
        startButtonLabel.setTitle("Start", for: .normal)
    }
    
    @objc func updateElapsedTimeLabel(timer: Timer) {
        print("updating elapsed time")
        if stopwatch.isRunning {
            
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenths = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            
            elapsedTimeLabel.text = String(format: "%02d:%02d.%d", minutes, seconds, tenths)
        } else {
            timer.invalidate()
        }
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }

}
