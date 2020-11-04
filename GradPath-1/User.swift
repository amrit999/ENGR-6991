//
//  Signup.swift
//  GradPath-1
//
//  Created by Amrit Kalsi on 2020-10-31.
//  Class to define User fields.

import Foundation
import RealmSwift

class User:Object {
    @objc dynamic var email : String?
    @objc dynamic var password : String?
    @objc dynamic var confirm_password : String?
    
}

