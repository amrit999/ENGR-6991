//
//  CourseTableViewCell.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-17.
//

import UIKit

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

    @IBAction func Save_Tapped(_ sender: Any) {
    }
    
}
