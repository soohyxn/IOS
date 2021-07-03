//
//  ViewController2.swift
//  Scheduler
//
//  Created by 장수현 on 2021/05/04.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet var dateLable: UILabel!
    var dateString: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController3 else {
            return
        }
        tempController.dateString = dateString
    }
    
    // 세번째 화면에서 백버튼을 눌러 두번째 화면으로 들어왔을 때 alert창이 나오는 것을 방지하기 위해서 이 함수 안에 씀
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view2 탄생")
        
        // alert창은 실행 중에 잠깐 나왔다가 사라지는 것이기 때문에 고정적으로 만들 수 없고 이렇게 코드로 생성한다
        let c: (UIAlertAction) -> Void = { action in self.dateLable.text = "Good!!" } // 클로져 생성
        // alert창도 뷰이기 때문에 컨트롤러가 필요함
        let alertController = UIAlertController(title: "약속시간", message: dateString, preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: c) // handler - 클릭했을 때 어떤 행동을 할 것인지
        alertController.addAction(alertAction)
        /*
         alertController.addAction(UIAlertAction(title: "No", style: .cancel,
         handler: { action in
         self.dateLabel.text = "Oops!"
         self.navigationController?.popViewController(animated: true)
         }))
         */
        alertController.addAction(UIAlertAction(title: "No", style: .cancel) { action in
            self.dateLable.text = "Oops!"
            self.navigationController?.popViewController(animated: true) // 관리하는 ViewController 중에서 pop하여 빼냄
        })
        
        // alert창을 표시, completion -Yes/No 중 행위가 끝나면 할 행동, 여기서는 아무것도 하지 않으므로 ()으로 둠
        self.present(alertController, animated: true, completion: { () in print("alert shown...") } )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view2 나 들어 가요")
        dateLable.text = dateString
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
