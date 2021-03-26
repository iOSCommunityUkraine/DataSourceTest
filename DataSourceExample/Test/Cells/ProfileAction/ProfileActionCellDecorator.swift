//
//  ProfileActionCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct ProfileActionCellDecorator: CellDecorator {
    func decorate(cell: ProfileActionCell, with item: ProfileActionViewModel) {
        cell.valueLabel.text = item.name
    }
}
