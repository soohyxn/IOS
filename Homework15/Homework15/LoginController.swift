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
            case .success(var str):
                str = str.trimmingCharacters(in: .whitespaces)
                if str.contains("0") || str.contains("-1") {
                    let alertController = UIAlertController(title: "로그인 실패", message: "다시 입력하세요~", preferredStyle: UIAlertController.Style.actionSheet)
                    alertController.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default))
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let movieController = storyBoard.instantiateViewController(withIdentifier: "Movie") as! MovieRankController
                    self.navigationController?.pushViewController(movieController, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
