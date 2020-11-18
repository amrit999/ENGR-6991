//
//  LevelViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-14.
//

import UIKit
var user_input:String = ""
class LevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func graduate_tapped(_ sender: Any) {
        user_input = "G";
    }
    
    @IBAction func undergrad_tapped(_ sender: Any) {
        user_input = "UG";
    }
    

}
