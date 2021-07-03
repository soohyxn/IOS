//
//  ViewController.swift
//  Movie
//
//  Created by 장수현 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var welcomeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameField.delegate = self // 조력자를 자기 자신으로 지정
    }

    @IBAction func register(_ sender: Any) {
        self.nameField.resignFirstResponder()
        
        let text = nameField.text
        if text!.isEmpty { // 아무것도 입력안해도 nil이 아니고 빈 문자열("")
            welcomeLable.text = "Enter name, please~"
        } else {
            welcomeLable.text = "\(text!) is registered!"
            let naviController = self.tabBarController?.viewControllers?[1] as? UINavigationController
            let controller = naviController?.viewControllers[0] as? MovieController
            controller?.nameString = nameField.text
        }
    }
}

// Viewcontroller 객체를 확장
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.nameField.backgroundColor = UIColor.green
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // 사용자가 register를 클릭했을 때 -> 커서가 사라졌을 때 호출됨
        textField.backgroundColor = UIColor.lightGray // textField = self.nameField 모두 자기 자신
        return true;
    }
}

