//
//  AcountTests.swift
//  BankeyUnitTests
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import XCTest

@testable import Bankey

class AccountTests: XCTestCase {
    
    let json = """
    [
        {
            "id": "1",
            "type": "Banking",
            "name": "Basic Saving",
            "amount": 929466.23,
            "createdDateTime": "2010-06-21T15:29:32Z"
        },
        {
            "id": "2",
            "type": "Banking",
            "name": "No-Fee All-in Chequing",
            "amount": 17562.44,
            "createdDateTime": "2011-06-21T15:29:32Z"
        }
    ]
    """
    
    override class func setUp() {
        super.setUp()
    }
    
    func testAccount() throws {
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        
        let result = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.count, 2)
        
        XCTAssertEqual(result[0].id, "1")
        XCTAssertEqual(result[0].type, .Banking)
        XCTAssertEqual(result[0].name, "Basic Saving")
        XCTAssertEqual(result[0].amount, 929466.23)
        XCTAssertEqual(result[0].createdDateTime.monthDayYearString, "21 июня, 2010")
    }
    
    
}
