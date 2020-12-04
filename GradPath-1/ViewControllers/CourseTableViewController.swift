//
//  CourseTableViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-17.
//
// View to define course recommendations cells

import UIKit
import RealmSwift

var myArray = [[String]]()
class CourseTableViewController: UITableViewController {
    //MARK: Properties //@IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "data", ofType: "txt")
        let url = URL(fileURLWithPath: path!)
        
// reading the data file
        
        let contentString = try! NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
        var csvRows: [String] = contentString.components(separatedBy: "\n")

        for row in csvRows {
            var csvColumns: [String] = row.components(separatedBy: ",")
            myArray.append(csvColumns)
        }
    }


    @IBAction func online_recommendation_tapped(_ sender: Any) {
        var Online_course_Dict:[Int:String] = [1:"https://www.udemy.com/course/beginners-guide-to-information-technology/", 2:"https://www.udemy.com/course/civil-engineering-interview-questions/", 3:"https://www.udemy.com/course/fundamentals-of-power-system-for-electrical-engineering-2/",4:"https://www.udemy.com/course/the-complete-software-engineering-course-for-beginners/",5:"https://www.udemy.com/course/rahsoft-introduction-to-environmental-chemistry-online-course-rahch320/"]
        
        var online_course = Online_course_Dict[level_input]

        if let link = URL(string: online_course!) {
          UIApplication.shared.open(link)
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
        if user_input == "G"{
            let out = myArray[indexPath.row]
            
            cell.university_name.text = out[1]
            cell.course_name.text = out[level_input+1]
        
        }
        if user_input == "UG"{
            let out = myArray[indexPath.row+6]
            
            cell.university_name.text = out[1]
            cell.course_name.text = out[level_input+1]
        
        }
        return cell
    }
    

}
