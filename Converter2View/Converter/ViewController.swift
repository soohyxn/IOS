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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        fahrenTextField.resignFirstResponder() // 소프트웨어 키보드 권한을 내려놓음, 키보드를 내리기 위해 씀
    }
    
    // comeback 버튼을 누르면 comeback 메소드 호출 -> 하는 일은 없지만 호출되기 위해서 현재 뷰가 내려가고 첫 화면 뷰가 올라옴
    @IBAction func comeback(segue: UIStoryboardSegue) {
        
    }
    
}

