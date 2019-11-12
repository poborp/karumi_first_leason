//
//  Clock.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

protocol ClockProtocol: class {
    func date() -> Date
}

class SystemClock: ClockProtocol {
    
    func date() -> Date {
        return Date()
    }
    
}

class FixedTimeClock: ClockProtocol {
    
    private let fixedDate: Date
    
    init(timestamp: TimeInterval) {
        self.fixedDate = Date(timeIntervalSince1970: timestamp)
    }
    
    func date() -> Date {
        return fixedDate
    }
    
}
