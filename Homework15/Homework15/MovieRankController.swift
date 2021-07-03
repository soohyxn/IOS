import UIKit
import Kanna
import Alamofire

class MovieRankController: UITableViewController {
    var movieItem: [String] = []
    var moviePage: [String] = []

    func getMovie() -> Void {
        let urlString = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn"
        AF.request(urlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let htmlStr):
                self.parseHTML(str: htmlStr)
            case .failure(let error):
                print(error)
            }
        }
    }

    func parseHTML(str: String) -> Void {
        let document = try? Kanna.HTML(html: str, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for item in doc.xpath("//div[@class='tit3']/a") {
            if let text = item.text {
                movieItem.append(text)
            }
        }
        for date in doc.xpath("//div[@class='tit3']/a/@href") {
            if let text = date.text {
                moviePage.append(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovie()
    }
    
    @IBAction func reload(_ sender: Any) {
        movieItem.removeAll()
        moviePage.removeAll()
        
        self.getMovie()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItem.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieRankCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = movieItem[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = storyBoard.instantiateViewController(withIdentifier: "Detail") as! DetailController
        self.navigationController?.pushViewController(detailController, animated: true)
        detailController.href = moviePage[indexPath.row]
    }

}
