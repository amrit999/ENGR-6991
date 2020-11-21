//
//  SignupViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-31.
//  View to define signup functionality

import UIKit
import RealmSwift

var myuser = User()

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signup_email: UITextField!
    @IBOutlet weak var signup_password: UITextField!
    @IBOutlet weak var signup_confirm_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signup_confirm(_ sender: Any) {
        let realm = try! Realm()
        // Get our Realm file's parent directory
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path

        // Disable file protection for this directory
        try! FileManager.default.setAttributes([FileAttributeKey(rawValue: FileAttributeKey.protectionKey.rawValue): FileProtectionType.none],
                                               ofItemAtPath: folderPath)
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
    
        
        // SIGNUP ACTION
        //var myuser = User()
        myuser.email = signup_email.text
        myuser.password = signup_password.text
        myuser.confirm_password = signup_confirm_password.text
        
        // check if input is empty
        // check if confirm password matches
        // and write signup details to the database
        // else promt user to re-enter the details
        if signup_email.text != "" && signup_password.text != "" && signup_confirm_password.text != ""{
            if myuser.password == myuser.confirm_password {
                try! realm.write{
                    realm.add(myuser)
                }
                    
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "Login_vc")
                        show(secondVC, sender: self)
            }
            else {
                signup_password.text = ""
                signup_confirm_password.text = ""
            }
        }
        else {
            signup_email.text = ""
            signup_password.text = ""
            signup_confirm_password.text = ""
        }
        
    }

}
