//
//  MainStoryboardManager.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/03.
//

import UIKit

struct MainStoryboardManager {
    
    // MARK: Main Storyboard
    static private let MainStoryboardIdentity: String = "Main"
    static private let mainStoryboard: UIStoryboard = UIStoryboard(name: MainStoryboardIdentity, bundle: nil)
    
    // MARK: Login Screen
    static private let LoginScreenIdentity: String = "LoginScreen"
    static func instantiateLoginScreen() -> LoginScreen {
        return mainStoryboard.instantiateViewController(withIdentifier: LoginScreenIdentity) as! LoginScreen
    }
    
    // MARK: - Register Screen
    static private let RegisterScreenIdentity: String = "RegisterScreen"
    static func instantiateRegisterScreen() -> RegisterScreen {
        return mainStoryboard.instantiateViewController(withIdentifier: RegisterScreenIdentity) as! RegisterScreen
    }
}
