//
//  ProfileAboutCellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct ProfileAboutCellDecorator: ViewDecorator {
    func decorate(view: ProfileAboutCell, with item: ProfileAboutViewModel) {
        view.valueLabel.text = item.message
        
        item.didChange = { [weak view] message in
            view?.valueLabel.text = message
        }
    }
}
