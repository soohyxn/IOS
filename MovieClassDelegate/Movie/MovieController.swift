//
//  MovieController.swift
//  Movie
//
//  Created by 장수현 on 2021/05/18.
//

import UIKit

class MovieController: UITableViewController {
    var nameString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (title, description, imageName) in dataset {
            let movie = Movie()
            movie.title = title
            movie.description = description
            movie.image = UIImage(named: imageName)
            movies.append(movie)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = self.nameString {
            self.navigationItem.title = "Movie-\(name)" // 네비게이션바의 타이틀
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // 섹션 개수
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count // 섹션 안의 행 개수
    }

    
    // cell 개수만큼 호출됨
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // IndexPath: cell들에 관한 정보
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) // tableView에 재사용가능한 큐에서 MovieCell이라는 셀이 있으면 주고 없으면 생성

        // Configure the cell...
        cell.textLabel?.text = movies[indexPath.row].title // indexPath.row - 몇 번째 cell인지

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath) // 몇 번째 셀이 터치됐는지
        //getting the text of that cell
        let currentText = currentCell?.textLabel?.text // 해당 셀의 텍스트
        let alertController = UIAlertController(title: "Your Choice", message: "You Selected " + currentText! , preferredStyle: .actionSheet)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let destination = segue.destination as? DetailController
        let index = tableView.indexPathForSelectedRow?.row // 선택된 cell이 몇 번째인지
        if let destination = destination, let index = index {
            destination.image = movies[index].image
        }
    }
    

}
