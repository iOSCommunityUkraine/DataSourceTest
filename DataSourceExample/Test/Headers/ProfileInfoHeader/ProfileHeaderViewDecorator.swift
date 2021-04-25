//
//  ProfileHeaderViewDecorator.swift
//  DataSourceExample
//
//  Created by Vitalii Karpenko on 4/25/21.
//

import Foundation

struct ProfileHeaderViewDecorator: ViewDecorator {
    func decorate(view: ProfileHeaderView, with item: ProfileHeaderViewModel) {
        view.titleLabel.text = item.title
    }
}
