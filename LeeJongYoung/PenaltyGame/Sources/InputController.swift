//
//  ViewController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/11/19.
//

import UIKit

class InputController: UIViewController {

    @IBOutlet weak var isUpdateLabel: UILabel!
    @IBOutlet weak var rowCountStepper: UIStepper!
    
    @IBAction func onStepper(_ sender: UIStepper) {
        self.isUpdateLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func clickResetButton(_ sender: Any) {
        self.rowCountStepper.value = 0
        isUpdateLabel.text = String(format: "%.0f", self.rowCountStepper.value)
    }

    @IBAction func clickNextButton(_ sender: Any) {
        guard rowCountStepper.value != 0 && rowCountStepper.value != 1 else {
            let alertController = UIAlertController(
                    title: "진행 불가",
                    message: "최소 2명 이상의 값이 필요합니다.",
                    preferredStyle: .alert)
                  
                  let alertAction = UIAlertAction(
                    title: "확인하기",
                    style: .cancel)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true)
            return
        }

        guard let penalistViewController = self.storyboard?.instantiateViewController(withIdentifier: "PenalistListViewController") as? PenalistListViewController else {
            return
        }
        
        penalistViewController.rowCount = Int(self.rowCountStepper.value)
        
        self.navigationController?.pushViewController(penalistViewController, animated: true)
    }

    override func viewDidLoad() {
        rowCountStepper.wraps = false
        rowCountStepper.maximumValue = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
