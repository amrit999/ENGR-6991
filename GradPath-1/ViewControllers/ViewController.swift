//
//  ViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-18.
//  First view to the user.

import UIKit
import SwiftCSV

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            let csvFile = try CSV(url: URL(fileURLWithPath: "./test.csv"))
            print(csvFile)
        } catch {
            print("parseError as CSVParseError")
        }

    }

    @IBAction func LoginTapped(_ sender: Any) {
        
        print("login tapped")
    }
    
    @IBAction func SignupTapped(_ sender: Any) {
        print("signup tapped")
    }
    
    
}

