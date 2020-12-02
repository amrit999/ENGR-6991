//
//  SignupViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-31.
//  View to define signup functionality

import UIKit
import RealmSwift
import BCrypt

var myuser = User()
let salt = "$2b$04$cVWp4XaNU8a4v1uMRum2SO"

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
        
        myuser.email = signup_email.text
        let pass = signup_password.text!

// check if input is empty
// check if confirm password matches
// and write signup details to the database
// else promt user to re-enter the details
        func validateEmail(candidate: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
        }
        
        if signup_email.text != "" && signup_password.text != "" && signup_confirm_password.text != ""{
            if validateEmail(candidate: signup_email.text!) {
                let existing_user = realm.objects(User.self).filter("email == %@",signup_email.text)
                if existing_user.isEmpty {
                    if signup_password.text == signup_confirm_password.text {
                       
                        do {
//  adds hashing for password protection
                            
                            let hashed = try BCrypt.Hash(pass, salt: salt)
                            print("Hashed result is: \(hashed)")
                            myuser.password = hashed
                        }
                        catch {
                            print("An error occured: \(error)")
                        }
                        
                        try! realm.write{
                            realm.add(myuser)
                        }
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "Login_vc")
                        show(secondVC, sender: self)
                    }
                    else {
                        let alert = UIAlertController(title: "Error", message: "Paasword doesnot match", preferredStyle: .alert)

                        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                        self.present(alert, animated: true)
                        
                        signup_password.text = ""
                        signup_confirm_password.text = ""
                    }
                        
                }
                else {
                    let alert = UIAlertController(title: "Error", message: "User Already Exists.", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    
                    signup_email.text = ""
                    signup_password.text = ""
                    signup_confirm_password.text = ""
                }
                
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Invalid Credentials.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
//                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                self.present(alert, animated: true)
                signup_email.text = ""
                signup_password.text = ""
                signup_confirm_password.text = ""
            }
                
     
        }
        
    }

}
