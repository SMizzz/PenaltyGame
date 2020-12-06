//
//  CountDownViewController.swift
//  GamePractice
//
//  Created by 신미지 on 2020/12/03.
//

import UIKit

class CountDownViewController: UIViewController{
  // MARK: - Properties
  @IBOutlet weak var countDownValueLabel: UILabel!
  var timeSec: Int = 4
  var timer: Timer?
  let timeSelector: Selector = #selector(CountDownViewController.updateTime)

  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: timeSelector, userInfo: nil, repeats: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: - Handlers
  @objc func updateTime() {
    self.countDownValueLabel.text = String(self.timeSec)
    if(timeSec > 0) {
      timeSec -= 1
    } else {
      timer?.invalidate()
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
      self.dismiss(animated: true, completion: nil)
    }
  }
}
