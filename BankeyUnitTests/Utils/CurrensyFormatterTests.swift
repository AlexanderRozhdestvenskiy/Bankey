//
//  CurrensyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Alexander Rozhdestvenskiy on 05.02.2022.
//

import XCTest

@testable import Bankey

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        
        formatter = CurrencyFormatter()
    }
    
    func testShouldBeVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(4366.23)
        XCTAssertEqual(result.0, "4,366")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(8222.34)
        XCTAssertEqual(result, "$8,222.34")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00")
    }
    
    func testDollarFormattedCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(22222.22)
        XCTAssertEqual(result, "\(currencySymbol)22,222.22")
    }
}
