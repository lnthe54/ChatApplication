//
//  LoginContact.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation

protocol LoginContract {
    typealias Presenter = _LoginPresenter
    typealias View = _LoginView
    typealias Model = _LoginModel
}

protocol _LoginView: NSObjectProtocol {
    func openRegisterScreen()
}

protocol _LoginPresenter {
    func attachView(_ view: LoginContract.View)
    func detach()
    func openRegisterScreen()
}

protocol _LoginModel {
    
}
