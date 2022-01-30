//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 30.01.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
