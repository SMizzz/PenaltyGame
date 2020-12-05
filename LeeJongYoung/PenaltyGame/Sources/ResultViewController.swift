//
//  ResultViewController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/11/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var penalistName: String?
    var timer: Timer?
    var totalTime = 5 //sec

    func startTimer() {
        self.navigationController?.isNavigationBarHidden = true //disable navigation bar
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return String(format: "%d", seconds)
    }

    @objc func updateTimer() {
        self.resultLabel.text = self.timeFormatted(self.totalTime) //show timer
        if totalTime != 0 {
            totalTime -= 1  //decrease counter timer
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil //terminate timer
                self.navigationController?.isNavigationBarHidden = false
                self.resultLabel.text = penalistName ?? " No Value"
            }
        }
    }
    
    override func viewDidLoad() {
        startTimer()
    }
}
