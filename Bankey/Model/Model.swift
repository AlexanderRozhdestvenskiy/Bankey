//
//  Model.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 30.01.2022.
//

import UIKit

let appColor: UIColor = .systemTeal

//struct Profile {
//    let firstName: String
//    let lastName: String
//}

enum AccountType: String {
    case Banking = "Сбережения"
    case CreditCard = "Кредитные карты"
    case Investment = "Инвестиции"
}

struct ViewModel {
    let accountType: AccountType
    let accountName: String
    let balance: Decimal
    
    var balanceAsAttributedString: NSAttributedString {
        return CurrencyFormatter().makeAttributedCurrency(balance)
    }
}
