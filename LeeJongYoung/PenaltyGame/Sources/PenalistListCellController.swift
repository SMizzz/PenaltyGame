//
//  PenalistListCellController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/12/06.
//

import UIKit

class PenalistListCellController: UITableViewCell {
    
    static var list: [PenalistInfo] = PenalistListViewController().list
    static var index: Int?
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func saveTextFieldData(_ sender: Any) {
        PenalistListCellController.list[PenalistListCellController.index ?? 0].name = self.textField.text ?? ""
    }
}
