//
//  Logout.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

enum LogoutError: Error {
    case date
}

class Logout {
    
    private let clock: ClockProtocol
    
    init(clock: ClockProtocol = SystemClock()) {
        self.clock = clock
    }
    
    func logout(completion: @escaping ((Result<Void, LogoutError>) -> Void)) {
        
        DispatchQueue.global(qos: .background).async {
            
            DispatchQueue.main.async {
                
                if Int(self.clock.date().timeIntervalSince1970) % 2 == 0 {
                    completion(.success(()))
                } else {
                    completion(.failure(.date))
                }
            }
        }
    }
    
}
