
import UIKit

class AdvisorController: UITableViewController {
    let advisorArray = ["정원호","음두헌","강남희","임양미","박태정"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advisorArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = advisorArray[indexPath.row]
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 교수 이름을 터치할 경우 호출되는 메소드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? StudentController else {
            return
        }
        let index = tableView.indexPathForSelectedRow?.row
        destController.advisorName = advisorArray[index!]
    }
}
