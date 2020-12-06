//
//  ResultViewController.swift
//  GamePractice
//
//  Created by 신미지 on 2020/11/25.
//

import UIKit

class ResultViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet weak var resultNameLabel: UILabel!
  @IBOutlet weak var countDownValueLabel: UILabel!
  
  var paramName: String = ""
  var timeSec: Int = 4
  var timer: Timer?
  let timeSelector: Selector = #selector(CountDownViewController.updateTime)

  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    resultNameLabel.isHidden = true
  }
  
  // MARK: - Handlers
  private func setup() {
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    self.resultNameLabel.text = paramName
  }
  
  @objc func updateTime() {
    self.countDownValueLabel.text = String(self.timeSec)
    if(timeSec == 0) {
      timer?.invalidate()
    } else {
      timeSec -= 1
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      self.countDownValueLabel.isHidden = true
      self.resultNameLabel.isHidden = false
    }
  }
}


