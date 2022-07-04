//
//  RegisterContract.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation

protocol RegisterContract {
    typealias View = _RegisterView
    typealias Presenter = _RegisterPresenter
    typealias Model = _RegisterModel
}

protocol _RegisterView: NSObjectProtocol {
    func showNotice(withMessage msg: String)
    func showAlert()
}

protocol _RegisterPresenter {
    func attachView(_ view: RegisterContract.View)
    func detach()
    func validateFields(email: String, name: String, password: String)
}

protocol _RegisterModel {
    func validateFields(email: String, name: String, password: String) -> String
    func checkForExistingEmail(_ email: String, completion: @escaping (_ errorMessage: String) -> Void)
    func registerUser(_ name: String, email: String, password: String, completion: @escaping (_ errorMessage: String) -> Void)
}
