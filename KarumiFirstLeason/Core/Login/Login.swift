//
//  Login.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case error
}

class Login {
    
    func login(user: String?, pass: String?, completion: @escaping ((Result<Void, LoginError>) -> Void)) {
        
        DispatchQueue.global(qos: .background).async {

            DispatchQueue.main.async {
                
                if user == "galicia", pass == "lloviendo" {
                    completion(.success(()))
                } else {
                    completion(.failure(.error))
                }
            }
        }
    }
    
}
