//
//  ProfileInfoCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct ProfileInfoCellDecorator: ViewDecorator {
    func decorate(view: ProfileInfoCell, with item: ProfileInfoViewModel) {
        view.firstNameLabel.text = item.firstName()
        view.lastNameLabel.text = item.lastName()
    }
}
