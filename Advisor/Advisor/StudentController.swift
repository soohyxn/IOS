
import UIKit
import Kanna
import Alamofire

class StudentController: UITableViewController {
    var advisorName: String? // 교수 이름을 받을 변수
    var studentArray: [String] = []
    
    func getStudents() -> Void {
        guard let advisor = advisorName else {
            return // nil이면 리턴
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/advisorPro.jsp" + "?advisor=" + advisor // GET방식
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlStr = encodedUrlString else {
            return
        }
        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in // reponse - 수신한 string (결과)
            switch response.result {
            case .success(let str):
                self.parseHTML(htmlStr: str) // 성공한 경우 수신한 string을 HTML로 파싱
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseHTML(htmlStr string: String) -> Void {
        let document = try? Kanna.HTML(html: string, encoding: .utf8) // try? - exception을 던질 수 있는 메소드를 실행할 때는 에러처리를 해줌, 에러 발생하면 전체를 nil 처리, 성공적인 경우엔 DOM 객체 생성
        guard let doc = document else {
            return
        }
        for node in doc.xpath("//h5") { // doc.xpath() - h5를 뽑아 배열로 반환 [<h5>음</h5>, <h5>송</h5>, ... ]
            if let text = node.text {
                studentArray.append(text)
                print(text)
            }
        }
        
        self.tableView.reloadData() // 테이블뷰의 세 개의 메소드가 다시 호출됨, 이것을 안하면 테이블뷰에 표시가 안됨
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getStudents()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = studentArray[indexPath.row]
        return cell
    }

}
