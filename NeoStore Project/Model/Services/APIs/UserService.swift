//
//  UserService.swift
//  NeoStore Project
//
//  Created by Neosoft on 03/02/22.
//

import Foundation

class UserService {
    static func userLogin(username: String, password: String, completionHandler: @escaping(APIResponse<Any>) -> Void) {
        
        let params = ["email": username, "password": password]
        
        // Perform Request
        APIManager.sharedInstance.performRequest(serviceType: .userLogin(parameters: params)) { response in
            switch response {
            case .success(value: let value):
                completionHandler(.success(value: value))
            case .failure(error: let error):
                print(error.localizedDescription)
                completionHandler(.failure(error: error))
            }
        }
    }
}
