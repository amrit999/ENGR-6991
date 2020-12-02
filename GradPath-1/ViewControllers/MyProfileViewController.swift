//
//  MyProfileViewController.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-12-01.
//

import UIKit
import RealmSwift
import BCrypt

class MyProfileViewController: UIViewController {

    
    @IBOutlet weak var old_password: UITextField!
    
    @IBOutlet weak var new_password: UITextField!
    
    @IBOutlet weak var confirm_new_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func update_password(_ sender: Any) {
        let realm = try! Realm()
        for myuser in realm.objects(User.self).filter("email == %@ ",user_session) {
            if new_password.text == confirm_new_password.text {
               
                do {
                    let pass = new_password.text!
                    let hashed = try BCrypt.Hash(pass, salt: salt)
                    
                    try! realm.write{
                        myuser.password = hashed
                    }
                }
                catch {
                    print("An error occured: \(error)")
                }
                
        }
            
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
