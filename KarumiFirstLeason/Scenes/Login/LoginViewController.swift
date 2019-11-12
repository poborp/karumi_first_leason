//
//  LoginViewController.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter?
    
    let nameTextField = UITextField()
    let passTextField = UITextField()
    let loginButton = UIButton()
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(), view: self)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocapitalizationType = .none
        nameTextField.autocorrectionType = .no
        //nameTextField.text = "galicia"
        nameTextField.placeholder = "Username"
        nameTextField.returnKeyType = .next
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        passTextField.borderStyle = .roundedRect
        passTextField.autocapitalizationType = .none
        passTextField.autocorrectionType = .no
        //passTextField.text = "lloviendo"
        passTextField.placeholder = "Password"
        passTextField.returnKeyType = .join
        passTextField.delegate = self
        view.addSubview(passTextField)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.setTitleColor(.darkGray, for: .highlighted)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action: #selector(didPressLoginButton(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        logoutButton.isHidden = true
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.setTitleColor(.darkGray, for: .highlighted)
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.addTarget(self, action: #selector(didPressLogoutButton), for: .touchUpInside)
        view.addSubview(logoutButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            passTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 20),
            
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: - Buttons
    
    @objc func didPressLoginButton(_ button: UIButton) {
        
        view.endEditing(true)
        
        presenter?.login(user: nameTextField.text, pass: passTextField.text)
    }
    
    @objc func didPressLogoutButton(_ button: UIButton) {
        
        presenter?.logout()
    }
    
}

// MARK: - LoginViewProtocol

extension LoginViewController: LoginViewProtocol {
    
    func hideLogInForm() {
        nameTextField.isHidden = true
        passTextField.isHidden = true
        loginButton.isHidden = true
    }
    
    func hideLogOutForm() {
        logoutButton.isHidden = true
    }
    
    func showLogInForm() {
        nameTextField.isHidden = false
        passTextField.isHidden = false
        loginButton.isHidden = false
    }
    
    func showLogOutForm() {
        logoutButton.isHidden = false
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - TextField Delegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            passTextField.becomeFirstResponder()
        } else if textField == passTextField {
            view.endEditing(true)
            presenter?.login(user: nameTextField.text, pass: passTextField.text)
        }
        
        return true
    }
    
}
