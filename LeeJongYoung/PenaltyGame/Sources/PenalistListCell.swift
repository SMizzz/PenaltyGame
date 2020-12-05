//
//  PenalistListCell.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/12/04.
//

import UIKit

class PenalistListCell: UITableViewCell {
    @IBOutlet weak var penalistName: UITextField!
    
    func textFieldDidChange(_ textField: UITextField) {
        let name: String = textField.text!
        print(name)
    }
}
