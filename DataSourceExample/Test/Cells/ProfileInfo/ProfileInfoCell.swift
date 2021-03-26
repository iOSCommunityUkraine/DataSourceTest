//
//  ProfileInfoCell.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

final class ProfileInfoCell: UITableViewCell {
    private(set) lazy var firstNameLabel = UILabel()
    private(set) lazy var lastNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(lastNameLabel)
        
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        firstNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        lastNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        lastNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
