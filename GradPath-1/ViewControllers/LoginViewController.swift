//
//  LoginViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-31.
//  View to define login functionality

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    

    @IBOutlet weak var login_email: UITextField!
    @IBOutlet weak var login_password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login_confirm(_ sender: Any) {
      let realm = try! Realm()
        
        // check if user exists
        // check if password is correct
        let login = realm.objects(User.self).filter("email == %@ AND password == %@",login_email.text, login_password.text)
        if (login.isEmpty ){
            print("nill nill")
        }
        else{
            print("not nill")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let thirdVC = storyboard.instantiateViewController(identifier: "Level_vc")
                    show(thirdVC, sender: self)
        }
    
    }
    

}
