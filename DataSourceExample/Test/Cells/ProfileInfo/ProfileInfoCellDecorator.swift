//
//  ProfileInfoCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct ProfileInfoCellDecorator: CellDecorator {
    func decorate(cell: ProfileInfoCell, with item: ProfileInfoViewModel) {
        cell.firstNameLabel.text = item.firstName()
        cell.lastNameLabel.text = item.lastName()
    }
}
