//
//  ViewController.swift
//  Homework12
//
//  Created by 장수현 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableNumber: UITextField!
    @IBOutlet var orderLabel: UILabel!
    var select: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableNumber.delegate = self
    }
}

extension ViewController: UITextFieldDelegate {
    /*
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.green
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.green
        return true;
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tableNumber.resignFirstResponder()
        let num = tableNumber.text
        
        if let select = self.select {
            if num!.isEmpty {
                orderLabel.text = select
            } else {
                orderLabel.text = "table \(num!) ordered \(select)"
            }
        } else {
            orderLabel.text = "Select a meal first!"
        }
        
        return true
    }
}

