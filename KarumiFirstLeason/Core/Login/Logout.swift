//
//  Logout.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

class Logout {
    
    private let clock: ClockProtocol
    
    init(clock: ClockProtocol = SystemClock()) {
        self.clock = clock
    }
    
    func logout() -> Bool {
        
        return Int(clock.date().timeIntervalSince1970) % 2 == 0
    }
    
}
