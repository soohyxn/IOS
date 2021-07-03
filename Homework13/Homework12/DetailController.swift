//
//  DetailController.swift
//  Homework12
//
//  Created by 장수현 on 2021/05/18.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    var image: UIImage!
    var desc: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mealImageView.image = image
        descriptionLabel.text = desc
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
