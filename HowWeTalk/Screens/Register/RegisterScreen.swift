//
//  RegisterScreen.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import UIKit

class RegisterScreen: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var signUpLabel: UILabel!
    @IBOutlet private weak var contentSignUpLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTf: UITextField!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nameTf: UITextField!
    @IBOutlet private weak var pwLabel: UILabel!
    @IBOutlet private weak var passwordTf: UITextField!
    @IBOutlet private weak var waringLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    private let presenter: RegisterPresenter = RegisterPresenter(RegisterModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindPresenter()
        setupUI()
    }
    
    // MARK: - Private functions
    private func bindPresenter() {
        presenter.attachView(self)
    }
    
    private func setupUI() {
        signUpLabel.font = UIFont.boldSystemFont(ofSize: 24)
        contentSignUpLabel.text = "More than 100+ users are using application for connect with their friends."
        contentSignUpLabel.font = UIFont.systemFont(ofSize: 14)
        contentSignUpLabel.textColor = .lightGray

        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailTf.placeholder = "Email"
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameTf.placeholder = "Name"
        
        pwLabel.font = UIFont.boldSystemFont(ofSize: 16)
        passwordTf.placeholder = "Password"
        passwordTf.isSecureTextEntry = true
        
        waringLabel.textColor = .red
        waringLabel.font = UIFont.systemFont(ofSize: 12)
        waringLabel.isHidden = true
        
        signUpButton.setTitle("REGISTER", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .black
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
    }
    
    // MARK: - IBActions
    @IBAction func didCloseScreenn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didRegisterAccount() {
        let emailValue: String = emailTf.text ?? String.empty
        let nameValue: String = nameTf.text ?? String.empty
        let passwordValue: String = passwordTf.text ?? String.empty
        
        presenter.validateFields(email: emailValue, name: nameValue, password: passwordValue)
    }
}

// MARK:
extension RegisterScreen: RegisterContract.View {
    func showNotice(withMessage msg: String) {
        waringLabel.text = msg
        waringLabel.isHidden = false
    }
    
    func showAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}
