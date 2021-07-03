
import UIKit
import Alamofire

class LoginController: UIViewController {
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        guard let id = idField.text, let passwd = passwdField.text else {
            return
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/loginPro.jsp" + "?id=" + id + "&passwd=" + passwd
        let encodedUrlStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlString = encodedUrlStr else {
            return
        }
        AF.request(encodedUrlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(var str): // str - 응답 문자열
                str = str.trimmingCharacters(in: .whitespaces) // 공백/리턴/탭을 제거함, 문자열 앞뒤의 불순물들은 제거해주지 못함, 문자열 안에서 불순물 제거
                if str.contains("0") || str.contains("-1") { // 0이나 -1을 포함하는 경우
                    self.idField.text = "Try Again!"
                    self.passwdField.text = ""
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil) // 스토리보드 객체 생성 - 스토리보드 객체는 전체를 관리함
                    let scheduleController = storyBoard.instantiateViewController(withIdentifier: "Schedule") as! ScheduleController // Schedule id를 가진 테이블 뷰 컨트롤러 생성 후 형 변환
                    self.navigationController?.pushViewController(scheduleController, animated: true) // navigationController의 뷰 컨트롤러 스택에 넣음
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
