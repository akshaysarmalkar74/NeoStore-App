//
//  ViewController.swift
//  NeoStore Project
//
//  Created by Neosoft on 01/02/22.
//

import UIKit

class DemoViewController: UIViewController {

    init() {
        super.init(nibName: StringConstants.demoViewController, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello World"
        // Do any additional setup after loading the view.
        
//        testFunc(serviceType: .getProducts(parameters: ["product_category_id": 1]))
//        testFunc(serviceType: .getProductDetails(parameters: ["product_id": 1]))
//        testFunc(serviceType: .setProductRating(parameters: ["product_id": "1", "rating": 4]))
        testFunc(serviceType: .userLogin(parameters: ["email": "akshay@kumar.com", "password": "akshay123"]))
    }

    func testFunc(serviceType: APIServices) {
        APIManager.sharedInstance.performRequest(serviceType: serviceType) { response in
            switch response {
            case .success(value: let value):
                if let data = value as? Data {
                    // Decode and Pass to Handler
                    do {
                        let jsonObj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                        print(jsonObj)
                    } catch let err {
                        print(err)
                    }
                }
            case .failure(error: let error):
                print(error.localizedDescription)
            }
        }
    }

    
}
