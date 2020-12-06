//
//  ViewController.swift
//  GamePractice
//
//  Created by 신미지 on 2020/11/25.
//

import UIKit

class ViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var stepper: UIStepper!
  
  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  // MARK: - Handlers
  private func setup() {
    stepper.wraps = false
    stepper.autorepeat = true
    stepper.maximumValue = 100
    stepper.minimumValue = 0
  }
  
  @IBAction func clickedStepper(_ sender: UIStepper) {
    let value = Int(sender.value).description
    self.valueLabel.text = value
  }
  
  @IBAction func nextStepButton(_ sender: UIButton) {
    guard let nvc = self.storyboard?.instantiateViewController(identifier: "NVC") as? NameListViewController else { return }
    nvc.cellCount = Int(self.stepper.value)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let way = segue.destination
    guard let nvc = way as? NameListViewController else { return }
    nvc.cellCount = Int(self.stepper.value)
  }
}

