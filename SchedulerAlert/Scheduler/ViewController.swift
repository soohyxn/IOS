//
//  ViewController.swift
//  Scheduler
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue.destination = ViewController2를 참조하는 객체, nil이면 return, 값이 있으면 tempcontroller에 저장
        guard let tempController = segue.destination as? ViewController2 else {
            return
        }
        //let tempController = segue.destination as! View2Controller
        let date = datePicker.date // Date형태, string 아님
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy, hh:mm a" // 원하는 date 형식 지정, a - AM/PM 표시하라는 의미
        tempController.dateString = dateFormatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view1 탄생")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view1 나 들어 가요")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view1 나 들어 왔어요")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view1 나 나가요")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view1 나 나왔어요")
    }
}
