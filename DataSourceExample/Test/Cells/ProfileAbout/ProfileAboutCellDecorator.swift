//
//  ProfileAboutCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct ProfileAboutCellDecorator: CellDecorator {
    func decorate(cell: ProfileAboutCell, with item: ProfileAboutViewModel) {
        cell.valueLabel.text = item.message
        
        item.didChange = { [weak cell] message in
            cell?.valueLabel.text = message
        }
    }
}
