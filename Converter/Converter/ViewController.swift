//
//  ViewController.swift
//  Converter
//
//  Created by 장수현 on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fahrenTextField: UITextField!
    @IBOutlet var celsiusLable: UILabel!
    
    override func viewDidLoad() { // 처음 실행될 때 한번 실행되는 메소드
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 140, y: 100, width: 95, height: 30))
        button.setTitle("변환", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(convert), for: .touchUpInside)
        view.addSubview(button)
    }

    @IBAction func convert(_ sender: Any) {
        /*
        let fahrenStr = fahrenTextField.text
        let fahrenheit = Double(fahrenStr!)
        let celsius = (fahrenheit! - 32.0) / 1.8 // nil일 경우 강제벗기기를 하면 에러 발생 -> 프로그램 종료
        let celsiusStr = String(celsius)
        celsiusLabel.text = "섭씨 " + celsiusStr
         */
        
         let fahrenStr = fahrenTextField.text // 입력한 텍스트를 가져옴, nill일 수 있음
         let fahrenheit = Double(fahrenStr!) // 강제 벗기기를 해서 Double로 변환, 값이거나 nil
         if let fahren = fahrenheit {
            let celsius = (fahren - 32.0) / 1.8
            let celsiusStr = String(celsius)
            celsiusLable.text = "섭씨 " + celsiusStr
         }
         else {
            celsiusLable.text = "화씨 값을 입력하세요"
        }
        
        /*
        let fahrenStr = fahrenTextField.text
        let fahrenheit = Double(fahrenStr!)
        guard let fahren = fahrenheit else {
            celsiusLabel.text = "화씨 값을 입력하세요"
            return
        }
        let celsius = (fahren - 32.0) / 1.8
        let celsiusStr = String(celsius)
        celsiusLabel.text = "섭씨 " + celsiusStr
         */
        
        fahrenTextField.resignFirstResponder()
    }
    
}

