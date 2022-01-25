//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 24.01.2022.
//

import UIKit

class AccountSummaryCell: UITableViewCell {
    
    let typeLabel = UILabel()
    let underLine = UIView()
    let nameLabel = UILabel()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountSummaryCell {
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.backgroundColor = appColor
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underLine)
    }
    
    private func layout() {
        typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2).isActive = true
        typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        
        underLine.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1).isActive = true
        underLine.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        underLine.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor).isActive = true
        underLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
}
