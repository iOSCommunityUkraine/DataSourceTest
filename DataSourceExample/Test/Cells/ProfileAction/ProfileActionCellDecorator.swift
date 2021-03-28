//
//  ProfileActionCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

struct ProfileActionCellDecorator: ViewDecorator {
    func decorate(view: ProfileActionCell, with item: ProfileActionViewModel) {
        view.valueLabel.text = item.name
    }
}
