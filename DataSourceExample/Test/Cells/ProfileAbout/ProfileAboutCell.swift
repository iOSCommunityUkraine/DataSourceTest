//
//  ProfileAboutCell.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

final class ProfileAboutCell: UITableViewCell {
    private(set) lazy var valueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    private func configure() {
        contentView.addSubview(valueLabel)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
}
