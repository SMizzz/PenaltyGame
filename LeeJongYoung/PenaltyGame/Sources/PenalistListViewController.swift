//
//  PenalistListViewController.swift
//  PenaltyGame
//
//  Created by 이종영 on 2020/11/23.
//

import UIKit

class PenalistInfo {
    var num: Int = 0
    var name: String?
}

class PenalistListViewController: UITableViewController {
    
    @IBOutlet weak var penalistName: UITextField!
    var rowCount: Int?
    var array = [String](repeating: "Name", count: 10)
    
    lazy var list: [PenalistInfo] = {
        var datalist = [PenalistInfo]()
        var index = 1
        for name in self.array {
            let penalist = PenalistInfo()
            penalist.num += index
            penalist.name = name
            datalist.append(penalist)
            if rowCount == index {
                break
            }
            index += 1
        }
        return datalist
    }()
    
    func randomInt(min: Int = 0, _ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }

    @objc private func moveResultController(_ sender: Any) {
        guard let resultController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {
            return
        }
//        resultController.penalistName = PenalistListCellController.list[randomInt(self.rowCount ?? 0)].name
        
        self.navigationController?.pushViewController(resultController, animated: true)
    }
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "결과 보기", style: .plain, target: self, action: #selector(moveResultController(_:)))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)

        let num = cell.viewWithTag(1) as? UILabel
        let name = cell.viewWithTag(2) as? UITextField
        
        num?.text = String(row.num)
        name?.placeholder = row.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PenalistListCellController.index = indexPath.row
    }
}
