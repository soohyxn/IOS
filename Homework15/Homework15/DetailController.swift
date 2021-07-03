import UIKit
import WebKit

class DetailController: UIViewController {
    @IBOutlet var movieView: WKWebView!
    var href: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://movie.naver.com" + href
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)
        
        movieView.load(req)
    }

}
