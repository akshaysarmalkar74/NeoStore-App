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
