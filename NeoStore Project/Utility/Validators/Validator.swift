//
//  Validator.swift
//  NeoStore Project
//
//  Created by Neosoft on 03/02/22.
//

import Foundation
import UIKit

class Validator {
    
    // Validate Email
    static func email(str: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: str)
    }
    
    // Validate Password
    static func password(str: String) -> Bool {
        if str.count > 6 {
            print("Password should be more than 6 Characters")
            return true
        }
        return false
    }
    
    // Validate First Name
    static func firstName(str: String) -> Bool {
        if str.count > 0 {
            return true
        }
        return false
    }
    
    // Validate Last Name
    static func lastName(str: String) -> Bool {
        if str.count > 0 {
            return true
        }
        return false
    }
    
    // Validate Phone Number
    static func phoneNumber(str: String) -> Bool {
        if str.count == 10 {
            return true
        }
        return false
    }
    
    // Validate Confirm Password
    static func confirmPassword(password: String, confirmPass: String) -> Bool {
        if password == confirmPass {
            return true
        }
        print("Passwords do not match")
        return false
    }
    
    // Validate Terms Button
    static func termsChecked(btn: UIButton) -> Bool {
        if btn.isSelected {
            return true
        }
        return false
    }
}
