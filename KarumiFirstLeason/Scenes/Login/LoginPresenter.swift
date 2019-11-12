//
//  LoginPresenter.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

protocol LoginViewProtocol {
    func hideLogInForm()
    func hideLogOutForm()
    func showLogInForm()
    func showLogOutForm()
    func showError(message: String)
}

class LoginPresenter {
    
    private let loginInteractor: Login
    private let logoutInteractor: Logout
    private let view: LoginViewProtocol
    
    init(loginInteractor: Login, logoutInteractor: Logout, view: LoginViewProtocol) {
        
        self.loginInteractor = loginInteractor
        self.logoutInteractor = logoutInteractor
        self.view = view
    }
    
    func login(user: String?, pass: String?) {
        
        if loginInteractor.login(user: user, pass: pass) {
            view.hideLogInForm()
            view.showLogOutForm()
        } else {
            view.showError(message: "Name or password are wrong")
        }
    }
    
    func logout() {
        
        if logoutInteractor.logout() {
            view.hideLogOutForm()
            view.showLogInForm()
        } else {
            view.showError(message: "Not available for now")
        }
    }
    
}
