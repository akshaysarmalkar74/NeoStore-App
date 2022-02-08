//
//  LoginScreenViewModel.swift
//  NeoStore Project
//
//  Created by Neosoft on 03/02/22.
//

import Foundation

protocol LoginScreenViewType {
    func doLogin(username: String, password: String)
}

class LoginScreenViewModel: LoginScreenViewType {
    
    // MARK:- Methods
    func doLogin(username: String, password: String) {
        UserService.userLogin(username: username, password: password) { res in
            switch res {
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
