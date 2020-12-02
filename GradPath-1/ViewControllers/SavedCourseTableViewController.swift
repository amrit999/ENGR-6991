//
//  SavedCourseTableViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-29.
//
// View Saved Recommendations

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
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
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
        cell.saved_university_name.text = output?.university[indexPath.row]
        cell.saved_course_name.text = output?.course[indexPath.row]
      
    
        return cell

       
    }

}
