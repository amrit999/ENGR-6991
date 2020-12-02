//
//  SavedCourseTableViewCell.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-29.
//

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
                let indexToDelete_course = myuser.university.index(of: saved_university_name.text!)
//                print(delete_course)
                myuser.university.remove(at: indexToDelete_course!)
            }
        }
        
    }
}
