//
//  ReusableCell.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableCell { }
extension UICollectionViewCell: ReusableCell { }
