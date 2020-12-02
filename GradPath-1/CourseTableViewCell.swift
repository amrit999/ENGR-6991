//
//  CourseTableViewCell.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-17.
//  Configuring course cells for table view

import UIKit
import RealmSwift

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var university_name: UILabel!
    @IBOutlet weak var course_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//Save recommendation to db when save is tapped.
    @IBAction func Save_Tapped(_ sender: Any) {
        print(course_name.text)
        let realm = try! Realm()
        try! realm.write {
            for myuser in realm.objects(User.self).filter("email == %@ ",user_session) {
                myuser.university.append(university_name.text!)
                myuser.course.append(course_name.text!)
            }
        }
        
    }
}
    

