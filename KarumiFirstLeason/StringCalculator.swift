//
//  StringCalculator.swift
//  KarumiFirstLeason
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import Foundation

enum StringCalculatorError: Error {
    case negativeNumber
}

class StringCalculator {
    
    func add(number: String) throws -> Float {
        
        if number.isEmpty {
            return 0
        }
        
        let numbersString = number.replacingOccurrences(of: "\n", with: ",")
        let numbersArray = numbersString.replacingOccurrences(of: " ", with: "").split(separator: ",")
        
        //return numbersArray.compactMap { Float($0) }.reduce(0, {$0 + $1})
        
        var sum: Float = 0
        for numberString in numbersArray {
            let number = Float(numberString) ?? 0
            if number < 0 {
                throw StringCalculatorError.negativeNumber
            }
            sum += number
        }
        
        return sum
    }
    
}
