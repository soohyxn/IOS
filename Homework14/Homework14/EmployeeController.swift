//
//  EmployeeController.swift
//  Homework14
//
//  Created by 장수현 on 2021/06/02.
//

import UIKit
import Kanna
import Alamofire

class EmployeeController: UITableViewController {
    var departmentName: String?
    var employeeNumArray: [String] = []
    var employeeArray: [String] = []

    func getEmployees() -> Void {
        guard let department = departmentName else {
            return
        }
        let urlString = "http://203.252.219.241:8080/FinalProject/advisorProHome.jsp" + "?dept=" + department
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlStr = encodedUrlString else {
            return
        }
        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let str):
                self.parseHTML(htmlStr: str)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseHTML(htmlStr string: String) -> Void {
        let document = try? Kanna.HTML(html: string, encoding: .utf8)
        guard let doc = document else {
            return
        }
        
        for node in doc.xpath("//h6") {
            if let text = node.text {
                employeeNumArray.append(text)
            }
        }
        
        for node in doc.xpath("//h5") {
            if let text = node.text {
                employeeArray.append(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getEmployees()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = employeeArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: employeeArray[indexPath.row], message: "사번: " + employeeNumArray[indexPath.row], preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default))
        
        self.present(alertController, animated: true, completion: nil)
    }

}
