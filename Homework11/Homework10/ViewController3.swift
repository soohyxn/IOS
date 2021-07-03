//
//  ViewController3.swift
//  Homework10
//
//  Created by 장수현 on 2021/05/11.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    var resultString: String?
    var scoreString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultString
        
        let alertController = UIAlertController(title: "One more time?",message: scoreString, preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        
        self.present(alertController, animated: true, completion: {} )
    }

}
