//
//  CourseTableViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-17.
//

import UIKit
import RealmSwift

var myArray = [[String]]()
class CourseTableViewController: UITableViewController {
    //MARK: Properties
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "data", ofType: "txt")
        let url = URL(fileURLWithPath: path!)
        let contentString = try! NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
        var csvRows: [String] = contentString.components(separatedBy: "\n")

        for row in csvRows {
            var csvColumns: [String] = row.components(separatedBy: ",")
            myArray.append(csvColumns)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // Configure the cell...
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CourseTableViewCell"
           
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CourseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
           }
           
           // Fetches the appropriate course for the data source layout.
        let out = myArray[indexPath.row]
        
        cell.university_name.text = out[1]
        cell.course_name.text = out[level_input+1]
    
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
