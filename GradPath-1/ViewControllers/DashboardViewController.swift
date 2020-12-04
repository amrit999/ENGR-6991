//
//  DashboardViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-29.
//
// Defines navigation in dashboard screen

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func My_Profile_tapped(_ sender: Any) {
    }
    
    @IBAction func Saved_Courses_Tapped(_ sender: Any) {
    }
    
    @IBAction func Logout_tapped(_ sender: Any) {
        user_session = ""
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "vc")
            let navigationController = UINavigationController(rootViewController: VC)
                show(navigationController, sender: self)
            exit(0)
            
    }
    
        
    
    
}
