//
//  LoginProtocol.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 14.01.2022.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}
