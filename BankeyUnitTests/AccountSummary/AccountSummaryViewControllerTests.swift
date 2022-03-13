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
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUsedId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        
        viewController = AccountSummaryViewController()
        
        mockManager = MockProfileManager()
        viewController.profileManager = mockManager
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
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        viewController.forceFetchProfile()
        
        XCTAssertEqual("Ошибка сети", viewController.errorAlert.title)
        XCTAssertEqual("Проверьте наличие сети", viewController.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        viewController.forceFetchProfile()
        
        XCTAssertEqual("Ошибка данных", viewController.errorAlert.title)
        XCTAssertEqual("Ошибка обработки данных", viewController.errorAlert.message)
    }
}
