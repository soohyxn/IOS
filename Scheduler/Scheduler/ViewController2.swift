//
//  ViewController2.swift
//  Scheduler
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var dateLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view2 탄생")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view2 나 들어 가요")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view2 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view2 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view2 나 나왔어요")
    }

}
