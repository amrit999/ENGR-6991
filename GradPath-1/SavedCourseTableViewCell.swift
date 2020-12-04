//
//  SavedCourseTableViewCell.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-29.
//
// Configure tabel view cell for saved course list

import UIKit
import RealmSwift

class SavedCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var saved_university_name: UILabel!
    
    @IBOutlet weak var saved_course_name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func delete_tapped(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            for myuser in realm.objects(User.self).filter("email == %@ ",user_session) {
                let indexToDelete_university = myuser.university.index(of: saved_university_name.text!)
                myuser.university.remove(at: indexToDelete_university!)
                let indexToDelete_course = myuser.course.index(of: saved_course_name.text!)
                myuser.course.remove(at: indexToDelete_course!)
            }
        }
        
    }
}
