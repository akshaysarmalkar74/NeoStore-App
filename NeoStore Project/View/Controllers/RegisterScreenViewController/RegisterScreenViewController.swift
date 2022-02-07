//
//  RegsiterScreenViewController.swift
//  NeoStore Project
//
//  Created by Neosoft on 03/02/22.
//

import UIKit

class RegisterScreenViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var termsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    init() {
        super.init(nibName: StringConstants.registerViewController, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func genderBtnTapped(_ sender: UIButton) {
        maleBtn.isSelected = false
        femaleBtn.isSelected = false
        
        // Select the tapped Btn
        sender.isSelected = true
    }
    
    
    @IBAction func termsBtnTapped(_ sender: UIButton) {
        termsBtn.isSelected = !termsBtn.isSelected
    }
    
}

extension RegisterScreenViewController {
    func setUp() {
        let textFields: [UITextField] = [firstNameField, lastNameField, emailField, passwordField, confirmPasswordField, phoneField]
        let inputImgs: [String] = ["username_icon", "username_icon", "email_icon", "password_icon", "cpassword_icon", "cellphone_icon"]
        
        for idx in 0..<textFields.count {
            // Set Border Width to Input
            textFields[idx].layer.borderWidth = 1.0
            
            // Set Border Color to Input
            textFields[idx].layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            // Customise Text Fields
            customiseTextField(textField: textFields[idx], imgName: inputImgs[idx])
        }
        
        // Add gestures
        addTapGestureToView()
        
        // Customise Navigation Bar
        customiseNavbar()
        
        // Change Terms Label Text Color
        termsLabel.textColor = .white
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
    
    // Customise Navigation Bar
    func customiseNavbar() {
        self.title = "Register"
        let height: CGFloat = 40
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.navigationController?.navigationBar.barTintColor = .mainRed
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // Add Tap Gesture to View
    func addTapGestureToView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
