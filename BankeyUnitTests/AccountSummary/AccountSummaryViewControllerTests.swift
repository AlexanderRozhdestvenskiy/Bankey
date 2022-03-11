//
//  AccountSummaryViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Alexander Rozhdestvenskiy on 11.03.2022.
//

import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    
    var viewController: AccountSummaryViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = AccountSummaryViewController()
    }
    
    func testServerError() throws {
        let titleAndMessage = viewController.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Ошибка сети", titleAndMessage.0)
        XCTAssertEqual("Проверьте наличие сети", titleAndMessage.1)
    }
    
    func testDecodingError() throws {
        let titleAndMessage = viewController.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Ошибка данных", titleAndMessage.0)
        XCTAssertEqual("Ошибка обработки данных", titleAndMessage.1)
    }
}
