//
//  UIVC+Utils.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 12.01.2022.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
//        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let statusBarsize = (view.window?.windowScene?.statusBarManager?.statusBarFrame.size)!
        let frame = CGRect(origin: .zero, size: statusBarsize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
