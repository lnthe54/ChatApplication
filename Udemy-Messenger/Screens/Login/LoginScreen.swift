//
//  LoginScreen.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/03.
//

import UIKit

class LoginScreen: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var contentLoginLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTf: UITextField!
    @IBOutlet private weak var pwLabel: UILabel!
    @IBOutlet private weak var passwordTf: UITextField!
    @IBOutlet private weak var forgotButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var signUpLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    
    private let presenter: LoginPresenter = LoginPresenter(model: LoginModel())
    
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
        loginLabel.font = UIFont.boldSystemFont(ofSize: 24)
        contentLoginLabel.text = "Hello there, please login first 👋"
        contentLoginLabel.font = UIFont.systemFont(ofSize: 14)
        contentLoginLabel.textColor = .lightGray

        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        emailTf.placeholder = "Email"
        
        pwLabel.font = UIFont.boldSystemFont(ofSize: 16)
        passwordTf.placeholder = "Password"
        passwordTf.isSecureTextEntry = true
        
        forgotButton.setTitle("Forgot password?", for: .normal)
        forgotButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        
        signUpLabel.text = "Don't have an account yet?"
        signUpLabel.font = UIFont.systemFont(ofSize: 13)
        signUpLabel.textColor = .darkGray
        
        signUpButton.setTitle("Register", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    // MARK: IBActions
    @IBAction func didForgotPassword() {
        
    }
    
    @IBAction func didLogin() {
        
    }
    
    @IBAction func didSignup() {
        presenter.openRegisterScreen()
    }
}

// MARK: - LoginContract.View
extension LoginScreen: LoginContract.View {
    func openRegisterScreen() {
        let registerScreen: RegisterScreen = MainStoryboardManager.instantiateRegisterScreen()
        self.present(registerScreen, animated: true, completion: nil)
    }
}
