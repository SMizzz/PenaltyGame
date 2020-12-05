//
//  ViewController.swift
//  PenaltyGame
//
//  Created by 김우성 on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {
    
    var participant = 0 // 스태퍼에서 입력한 참석인원을 저장할 변수
    var peopleName = Array<String>()
    var peopleNameDic = Dictionary<Int, String>()
    let memberLabel = UILabel() // 값을 입력하라고 알려주는 label
    
    let isMember = UILabel() // stepper 값이 변동이 생길때 알려줄 label
    let memberStepper = UIStepper() // stepper
    let nextPage = UIButton() // 값을 모두 입력받은 후 넘어가도록 누르는 button
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabel()
        isMemberLabel()
        nextBtn()
        
    }
    
    
    
    
    // 스태퍼 버튼을 누를때마다 실행될 메소드
    @objc func stepperAction(_ sender: UIStepper) {
        let displayMember = Int(self.memberStepper.value)+1
        self.isMember.text = "\(displayMember) 명" //  현재 명수를 보여주기 위한 코드 
        
        let value = self.memberStepper.value
        let plist = UserDefaults.standard
        
        plist.setValue(value, forKey: "member")
        plist.synchronize()
        
    }
    
    
    @objc func nextPageBtn(_ sender: UIButton) {
        let maxinumNum = Int(self.memberStepper.value)
        
        let alert = UIAlertController(title: "이름입력",
                                      message: "이름을 입력해주세요",
                                      preferredStyle: .alert)
        
        // 작성된 사람 숫자만큼 텍스트필드를 만든다.
        for i in (0...maxinumNum) {
            alert.addTextField { $0.placeholder = "\(i+1) 번째 참가자 이름"}
        }
        
        
        let ok = UIAlertAction(title: "입력완료", style: .default) { (_) in
            // 입력완료 누르면 값을 UserDefault에 저장한다.
            for i in (0...maxinumNum-1) {
                // 값을 입력하지 않았을 때, 대응하도록 코드를 작성해야할 듯(나중에)
                let value = alert.textFields?[i].text!
                
                let plist = UserDefaults.standard
                plist.setValue(value, forKey: "name\(i)")
                plist.synchronize()
            }

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController02") as! ViewController02
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .partialCurl
            self.present(vc,animated: true)

        }
        
        alert.addAction(ok)
        alert.addAction(UIAlertAction(title: "뒤로가기", style: .cancel))
        self.present(alert, animated: false)
        
 
        

    }
    
}   





extension ViewController {
    
    
    func makeLabel () {
        let viewWidth = Int(self.view.frame.size.width)
        let viewheight = Int(self.view.frame.size.height)
        
        // 사용자에게 stepper에 어떤 값을 넣어야 하는지 알아야 값을 넣을 수 있으니, 그것을 알려줄 Label이 필요하고 이곳에 구현했습니다.
        self.memberLabel.frame.size = CGSize(width: viewWidth * 2 / 3,
                                             height: 60)
        self.memberLabel.center.x = CGFloat(viewWidth / 2)
        self.memberLabel.center.y = CGFloat(viewheight / 2 - 70)
        self.memberLabel.text = "참여인원을 입력해주세요."
        self.memberLabel.textAlignment = .center
        self.memberLabel.textColor = .black
        self.view.addSubview(self.memberLabel)
        
        // Label을 보고 값을 입력을 할 수 있도록 stepper를 구현했습니다.
        self.memberStepper.frame.size = CGSize(width: viewWidth / 3,
                                               height: 60)
        self.memberStepper.center.x = CGFloat(viewWidth*2 / 3)
        self.memberStepper.center.y = CGFloat(self.view.frame.height/2)
        
        self.memberStepper.backgroundColor = UIColor.white
        self.memberStepper.stepValue = 1
        self.memberStepper.minimumValue = 0
        self.memberStepper.maximumValue = 20
        self.memberStepper.addTarget(self,
                                     action: #selector(stepperAction(_:)),
                                     for: .touchUpInside)
        self.view.addSubview(self.memberStepper)
    }
    
    func isMemberLabel() {
        let viewWidth = Int(self.view.frame.size.width)
        let viewheight = Int(self.view.frame.size.height)
        
        // 스태퍼를 눌렀을 때 값이 몇 명이 늘었는지 알 수 있는 상태 표시창을 label로 구현했습니다.
        self.isMember.frame.size = CGSize(width: viewWidth / 3,
                                          height: 60)
        self.isMember.center.x = CGFloat(viewWidth / 3)
        self.isMember.center.y = CGFloat(viewheight / 2)
        self.isMember.textColor = .black
        self.isMember.text = "1 명"
        self.view.addSubview(self.isMember)
        
    }
    func nextBtn() {
        let viewWidth = Int(self.view.frame.size.width)
        let viewheight = Int(self.view.frame.size.height)
        
        // 다음 페이지로 넘어갈 버튼을 구현했습니다.
        self.nextPage.frame.size = CGSize(width: viewWidth * 2 / 3,
                                          height: 60)
        self.nextPage.center.x = CGFloat(viewWidth / 2)
        self.nextPage.center.y = CGFloat(viewheight / 2 + 70)
        self.nextPage.setTitle("입력 완료", for: .normal)
        self.nextPage.setTitleColor(.white, for: .normal)
        self.nextPage.addTarget(self, action: #selector(nextPageBtn(_:)), for: .touchUpInside)
        self.nextPage.backgroundColor = .black 
        self.view.addSubview(self.nextPage)
    }
}

