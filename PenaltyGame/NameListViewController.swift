//
//  NameListViewController.swift
//  GamePractice
//
//  Created by 신미지 on 2020/11/25.
//

import UIKit

class NameListViewController: UIViewController {
  // MARK: - Properties
  var cellCount: Int = 0
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Handlers
  @IBAction func onSubmit(_ sender: Any) {
    guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
    let indexNumber = Int.random(in: 0..<cellCount)
    let selectCell = tableView.cellForRow(at: IndexPath(row: indexNumber, section: 0)) as? ListCell
    guard let selectCellText = selectCell?.nameTextField.text else { return }
    rvc.paramName = selectCellText
    self.present(rvc, animated: true, completion: nil)
  }
}
  
extension NameListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cellCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
    return cell
  }
}

class ListCell: UITableViewCell {
  @IBOutlet weak var nameTextField: UITextField!
}

