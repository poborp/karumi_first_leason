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
        
        loginInteractor.login(user: user, pass: pass) { (result) in
            switch result {
            case .success:
                self.view.hideLogInForm()
                self.view.showLogOutForm()
            case .failure(let error):
                switch error {
                case .error:
                    self.view.showError(message: "Name or password are wrong")
                }
            }
        }
    }
    
    func logout() {
        
        logoutInteractor.logout { (result) in
            switch result {
            case .success:
                self.view.hideLogOutForm()
                self.view.showLogInForm()
            case .failure(let error):
                switch error {
                case .date:
                    self.view.showError(message: "Not available for now")
                }
            }
        }
    }
    
}
