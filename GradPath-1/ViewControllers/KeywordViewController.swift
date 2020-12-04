//
//  KeywordViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-11-02.

//  View to define keyword choosing

import UIKit
import Foundation

// level input to map to recommendation

var level_input: Int = 0
class KeywordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var softwareButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func key_1_tapped(_ sender: Any) {
//        user_input += "1"
        level_input = 1
//        print(user_input)
    }
    
    @IBAction func key_2_tapped(_ sender: Any) {
        
        level_input = 2
     
    }
    
    @IBAction func key_3_tapped(_ sender: Any) {
        
        level_input = 3
       
    }
    
    @IBAction func key_4_tapped(_ sender: Any) {    
       
        level_input = 4
        
    }
    
    @IBAction func key_5_tapped(_ sender: Any) {
      
        level_input = 5
    }
    
    
}

