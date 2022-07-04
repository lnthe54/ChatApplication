//
//  LoginPresenter.swift
//  Udemy-Messenger
//
//  Created by The Ngoc on 2022/07/04.
//

import Foundation

class LoginPresenter: LoginContract.Presenter {
    
    weak private var view: LoginContract.View?
    private var model: LoginContract.Model
    
    required init(model: LoginContract.Model) {
        self.model = model
    }
    
    func attachView(_ view: LoginContract.View) {
        self.view = view
    }
    
    func detach() {
        self.view = nil
    }
    
    func openRegisterScreen() {
        view?.openRegisterScreen()
    }
}
