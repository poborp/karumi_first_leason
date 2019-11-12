//
//  Login.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

class Login {
    
    func login(user: String?, pass: String?) -> Bool {
        
        if user == "galicia", pass == "lloviendo" {
            return true
        } else {
            return false
        }
    }
    
}
