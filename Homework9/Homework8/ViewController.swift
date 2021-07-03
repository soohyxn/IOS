//
//  ViewController.swift
//  Homework8
//
//  Created by 장수현 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var dingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dingConvert(_ sender: Any) {
        let nameStr = nameTextField.text
        let ageStr = ageTextField.text
        let ageNum = Int(ageStr!)
        
        if let name = nameStr {
            if name.isEmpty {
                dingLabel.text = "name을 입력하세요"
            } else {
                if let age = ageNum {
                    switch age {
                    case 8..<14:
                        dingLabel.text = "\(name)님은 초딩"
                    case 14..<17:
                        dingLabel.text = "\(name)님은 중딩"
                    case 17..<20:
                        dingLabel.text = "\(name)님은 고딩"
                    default:
                        dingLabel.text = "\(name)님은 기타"
                    }
                } else {
                    dingLabel.text =  "age를 입력하세요"
                }
            }
        }
       
       nameTextField.resignFirstResponder()
       ageTextField.resignFirstResponder()
    }
    
    @IBAction func comeback(segue: UIStoryboardSegue) {
        
    }
}

