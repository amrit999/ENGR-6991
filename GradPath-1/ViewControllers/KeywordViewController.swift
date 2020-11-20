//
//  KeywordViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-02.
//  View to define keyword choosing

import UIKit
import Foundation

class KeywordViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func key_1_tapped(_ sender: Any) {
        user_input += "1"
        print(user_input)
    }
    
    @IBAction func key_2_tapped(_ sender: Any) {
        user_input += "2"
        print(user_input)
    }
    
    @IBAction func key_3_tapped(_ sender: Any) {
        user_input += "3"
        print(user_input)
    }
    
    @IBAction func key_4_tapped(_ sender: Any) {    
        user_input += "4"
        print(user_input)
    }
    
    @IBAction func key_5_tapped(_ sender: Any) {
        user_input += "5"
        print(user_input)
    }
    
    
}

