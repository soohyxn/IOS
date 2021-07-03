//
//  ViewController.swift
//  Homework10
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var name: UITextField!
    @IBOutlet var nameLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController2 else {
            return
        }
        tempController.nameString = name.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func useButton(_ sender: Any) {
        let nameStr = name.text
        
        if let name = nameStr {
            if name.isEmpty {
                nameLabel.text = "Enter name please!"
            } else {
                nameLabel.text = "Welcome \(name)!!"
            }
        }
       
       name.resignFirstResponder()
    }
    
}

