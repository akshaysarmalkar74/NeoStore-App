//
//  Validator.swift
//  NeoStore Project
//
//  Created by Neosoft on 03/02/22.
//

import Foundation

class Validator {
    
    // Validate Email
    static func email(str: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: str)
    }
    
    // Validate Password
    static func password(str: String) -> Bool {
        if str.count > 0 {
            return true
        }
        return false
    }
}
