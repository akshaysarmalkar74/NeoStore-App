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
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Variables
    var isKeyBoardExpanded: Bool = false
    var viewModel: RegisterScreenViewType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        // Set Notification Observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappeared(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    init(viewModel: RegisterScreenViewType) {
        self.viewModel = viewModel
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
    
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        // Get Validations Results
        let firstNameValid = Validator.firstName(str: firstNameField.text ?? "")
        let lastNameValid = Validator.lastName(str: lastNameField.text ?? "")
        let emailValid = Validator.email(str: emailField.text ?? "")
        let passwordValid = Validator.password(str: passwordField.text ?? "")
        let confirmPasswordValid = Validator.confirmPassword(password: passwordField.text ?? "", confirmPass: confirmPasswordField.text ?? "")
        let phoneValid = Validator.phoneNumber(str: phoneField.text ?? "")
        let termsValid = Validator.termsChecked(btn: termsBtn)
        
        // Check all Validations
        if firstNameValid && lastNameValid && emailValid && passwordValid && confirmPasswordValid && phoneValid && termsValid {
            let actualPhoneNum: Int = Int(phoneField.text!)!
            let genderValue: String = maleBtn.isSelected ? "Male" : "Female"
            
            viewModel.doRegister(firstName: firstNameField.text!, lastName: lastNameField.text!, email: emailField.text!, password: passwordField.text!, confirmPassword: confirmPasswordField.text!, gender: genderValue, phoneNumber: actualPhoneNum)
        } else {
            print("Some Data is missing/improper")
        }
    }
    
    // KeyBoard Notification Functions
    @objc func keyboardAppeared(_ notification: Notification) {
        if !isKeyBoardExpanded {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height + keyboardHeight)
                isKeyBoardExpanded = true
            }
        }
    }
    
    @objc func keyboardDisappeared(_ notification: Notification) {
        if isKeyBoardExpanded {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width, height: self.scrollView.frame.height - keyboardHeight)
                isKeyBoardExpanded = false
            }
        }
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
        // Set Title
        self.title = "Register"
        
        // Customise Naviagtion Bar
        let height: CGFloat = 40
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        self.navigationController?.navigationBar.barTintColor = .mainRed
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Customise Back Button Color & Title
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
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
