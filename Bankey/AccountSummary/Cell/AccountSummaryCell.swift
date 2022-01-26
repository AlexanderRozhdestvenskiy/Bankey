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
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
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
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Account Name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Some balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.text = "$929,466.63"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underLine)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    
    private func layout() {
        typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2).isActive = true
        typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        
        underLine.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1).isActive = true
        underLine.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        underLine.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor).isActive = true
        underLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 2).isActive = true
        nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        
        balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 0).isActive = true
        balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4).isActive = true
        trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4).isActive = true
        
        chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underLine.bottomAnchor, multiplier: 1).isActive = true
        trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1).isActive = true
    }
}
