//
//  ViewController.swift
//  PenaltyGame
//
//  Created by 김우성 on 2020/11/19.
//

import UIKit

class ViewController03: UIViewController {
    
    //let memberLabel = UILabel() // 값을 입력하라고 알려주는 label
    //let isMember = UILabel() // stepper 값이 변동이 생길때 알려줄 label
    //let memberStepper = UIStepper() // stepper
    let nextPage = UIButton() // 값을 모두 입력받은 후 넘어가도록 누르는 button
    var peopleNumber = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        //makeLabel()
        //isMemberLabel()
        nextBtn()  
    }
    
    
    
    
    
    
    
    
    
    
    // 스태퍼 버튼을 누를때마다 실행될 메소드
    @objc func stepperAction(_ sender: UIStepper) {

    }
    
    // 입력완료
    @objc func nextPageBtn(_ sender: UIButton) {
        // plist에 값을 읽어온다.
        let plist = UserDefaults.standard
        let member = plist.integer(forKey: "member")
        let picked = plist.integer(forKey: "picked")
        var pickedName: Array<String> = []
        var temp = Set<Int>()
        
        while temp.count != picked+1 {
            temp.insert(Int.random(in: 0...member))
        }
    
        for i in temp {
            pickedName.append(plist.string(forKey: "name\(i)")!) // 이름
            
        }
        
        for i in pickedName {
            print(String(i))
        }
        
        
        
        
        
 
    }
  
}

  





extension ViewController03 {
    
//    func makeLabel () {
//        let viewWidth = Int(self.view.frame.size.width)
//        let viewheight = Int(self.view.frame.size.height)
//        
//        // 사용자에게 stepper에 어떤 값을 넣어야 하는지 알아야 값을 넣을 수 있으니, 그것을 알려줄 Label이 필요하고 이곳에 구현했습니다.
//        self.memberLabel.frame.size = CGSize(width: viewWidth * 2 / 3,
//                                             height: 60)
//        self.memberLabel.center.x = CGFloat(viewWidth / 2)
//        self.memberLabel.center.y = CGFloat(viewheight / 2 - 70)
//        self.memberLabel.text = "벌칙인원을 입력해주세요."
//        self.memberLabel.textAlignment = .center
//        self.memberLabel.textColor = .black
//        self.view.addSubview(self.memberLabel)
//        
//        // Label을 보고 값을 입력을 할 수 있도록 stepper를 구현했습니다.
//        self.memberStepper.frame.size = CGSize(width: viewWidth / 3,
//                                               height: 60)
//        self.memberStepper.center.x = CGFloat(viewWidth*2 / 3)
//        self.memberStepper.center.y = CGFloat(self.view.frame.height/2)
//        
//        self.memberStepper.backgroundColor = UIColor.white
//        self.memberStepper.stepValue = 1
//        self.memberStepper.minimumValue = 0
//        self.memberStepper.maximumValue = 20
//        self.memberStepper.addTarget(self,
//                                     action: #selector(stepperAction(_:)),
//                                     for: .touchUpInside)
//        self.view.addSubview(self.memberStepper)
//    }
    
//    func isMemberLabel() {
//        let viewWidth = Int(self.view.frame.size.width)
//        let viewheight = Int(self.view.frame.size.height)
//        
//        // 스태퍼를 눌렀을 때 값이 몇 명이 늘었는지 알 수 있는 상태 표시창을 label로 구현했습니다.
//        self.isMember.frame.size = CGSize(width: viewWidth / 3,
//                                          height: 60)
//        self.isMember.center.x = CGFloat(viewWidth / 3)
//        self.isMember.center.y = CGFloat(viewheight / 2)
//        self.isMember.textColor = .black
//        self.isMember.text = "1 명"
//        self.view.addSubview(self.isMember)
//        
//    }
    func nextBtn() {
        let viewWidth = Int(self.view.frame.size.width)
        let viewheight = Int(self.view.frame.size.height)
        
        // 다음 페이지로 넘어갈 버튼을 구현했습니다.
        self.nextPage.frame.size = CGSize(width: viewWidth * 1 / 3,
                                          height: 60)
        self.nextPage.center.x = CGFloat(viewWidth / 3 )
        self.nextPage.center.y = CGFloat(viewheight / 2 )
        self.nextPage.setTitle("결과확인", for: .normal)
        self.nextPage.setTitleColor(.white, for: .normal)
        self.nextPage.addTarget(self, action: #selector(nextPageBtn(_:)), for: .touchUpInside)
        self.nextPage.backgroundColor = .black 
        self.view.addSubview(self.nextPage)
    }
}

