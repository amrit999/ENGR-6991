//
//  ViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-18.
//  First view to the user.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func LoginTapped(_ sender: Any) {
        
        print("login tapped")
    }
    
    @IBAction func SignupTapped(_ sender: Any) {
        print("signup tapped")
    }
    
    
}

