//
//  SavedCourseTableViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-29.
//

import UIKit
import RealmSwift

var saved_university = List<String>()
//var saved_course = List<String>()

var saved_course_array = [String]()
class SavedCourseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return saved_course.count
        let realm = try! Realm()
        let output = realm.objects(User.self).filter("email == %@",user_session).first?.university
        return output!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellIdentifier = "SavedCourseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SavedCourseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
           }
           
           // Fetches the appropriate course for the data source layout.
        let realm = try! Realm()
        let output = realm.objects(User.self).filter("email == %@",user_session).first
//        var out = realm.objects(User.self).filter("email == %@ ",myuser.email).first?.university
        print (output)
        
//
//        cell.saved_university_name.text = abc.university[0]
//        cell.saved_course_name.text = abc.course[0]
        cell.saved_university_name.text = output?.university[indexPath.row]
        cell.saved_course_name.text = output?.course[indexPath.row]
      
    
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
