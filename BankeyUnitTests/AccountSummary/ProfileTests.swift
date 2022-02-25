//
//  ProfileTests.swift
//  BankeyUnitTests
//
//  Created by Alexander Rozhdestvenskiy on 25.02.2022.
//

import XCTest

@testable import Bankey

class ProfileTests: XCTestCase {
    
    let json = """
    {
        "id": "1",
        "first_name": "Kevin",
        "last_name": "Flynn"
    }
    """
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Kevin")
        XCTAssertEqual(result.lastName, "Flynn")
    }
}
