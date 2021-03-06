//
//  LoginScreenViewController.swift
//  NeoStore Project
//
//  Created by Neosoft on 02/02/22.
//

import UIKit

class LoginScreenViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var plusIcon: UIImageView!
    
    var viewModel: LoginScreenViewType!
    
    init(viewModel: LoginScreenViewType) {
        self.viewModel = viewModel
        super.init(nibName: "LoginScreenViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUp()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @IBAction func loginBtnTapped(_ sender: UIButton) {
        // Validate Email And Password
        let emailResult = Validator.email(str: usernameField.text ?? "")
        let passwordResult  = Validator.password(str: passwordField.text ?? "")
        
        if emailResult && passwordResult {
            viewModel.doLogin(username: "akshay@kumar.com", password: "akshay123")
        } else {
            print("Some Data is Missing or Improper Data")
        }
        
    }
    
    @IBAction func forgotBtnTapped(_ sender: Any) {
        print("Forgot Tapped")
    }
}

extension LoginScreenViewController {
    func setUp() {
        // Set Border Width to Input
        usernameField.layer.borderWidth = 1.0
        passwordField.layer.borderWidth = 1.0
        
        // Set Border Color to Input
        usernameField.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        passwordField.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Add gestures
        addTapGestureToView()
        addTapGestureToPlusIcon()
        
        // Customise Text Fields
        customiseTextField(textField: usernameField, imgName: "username_icon")
        customiseTextField(textField: passwordField, imgName: "password_icon")
    }
    
    // Customise Text Fields
    func customiseTextField(textField: UITextField, imgName: String) {
        
        let imageView = UIImageView(frame: CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0))
        let image = UIImage(named: imgName)
        imageView.image = image
        imageView.contentMode = .center
        imageView.backgroundColor = UIColor.red

        // Create Container View
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imageView)
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = view
    }
    
    // Add Tap Gesture to View
    func addTapGestureToView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // Add tap gesture to Plus Icon
    func addTapGestureToPlusIcon() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusIconTapped(_:)))
        plusIcon.addGestureRecognizer(tapGesture)
    }
    
    @objc func plusIconTapped(_ sender: UITapGestureRecognizer) {
        print("Plus Icon Tapped")
    }
}
