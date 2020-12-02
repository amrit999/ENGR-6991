//
//  LoginViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-31.
//  View to define login functionality

import UIKit
import RealmSwift
import BCrypt

var user_session = ""
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
        let pass = login_password.text!
        do {
            let hashed = try BCrypt.Hash(pass, salt: salt)
            print("Hashed result is: \(hashed)")
            let login = realm.objects(User.self).filter("email == %@ AND password == %@",login_email.text, hashed)
            if (login.isEmpty ){
                
                let alert = UIAlertController(title: "Error", message: "Invalid Login Credentials", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("nill nill")
                
            }
                
            else{
                print("not nill")
                user_session = login_email.text!

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let thirdVC = storyboard.instantiateViewController(identifier: "Level_vc")
                        let navigationController = UINavigationController(rootViewController: thirdVC)
                        show(navigationController, sender: self)
            }
        }
        catch {
            print("An error occured: \(error)")
        }
            
    
    }
    

}
