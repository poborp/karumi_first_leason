//
//  StringCalculator.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

class StringCalculator {
    
    func add(number: String) -> Float {
        
        if number.isEmpty {
            return 0
        }
        
        let numbersString = number.replacingOccurrences(of: "\n", with: ",")
        let numbersArray = numbersString.replacingOccurrences(of: " ", with: "").split(separator: ",")
        
        var sum: Float = 0
        for n in numbersArray {
            sum += Float(n) ?? 0
        }
        
        return sum
    }
    
}
