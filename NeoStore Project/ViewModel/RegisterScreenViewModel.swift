//
//  RegisterScreenViewModel.swift
//  NeoStore Project
//
//  Created by Neosoft on 07/02/22.
//

import Foundation

protocol RegisterScreenViewType {
    func doRegister(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, gender: String, phoneNumber: Int)
}

class RegisterScreenViewModel: RegisterScreenViewType {
    
    // MARK:- Methods
    func doRegister(firstName: String, lastName: String, email: String, password: String, confirmPassword: String, gender: String, phoneNumber: Int) {
        UserService.userRegister(firstName: firstName, lastName: lastName, email: email, password: password, confirmPassword: confirmPassword, gender: gender, phoneNumber: phoneNumber) { response in
            switch response {
            case .success(value: let value):
                if let curData = value as? Data {
                    do {
                        let mainData = try JSONSerialization.jsonObject(with: curData, options: .mutableContainers)
                        print(mainData)
                    } catch let err {
                        print(err.localizedDescription)
                    }
                } else {
                    print("Some Another Error")
                }
            case .failure(error: let error):
                print(error.localizedDescription)
            }
        }
    }
}
