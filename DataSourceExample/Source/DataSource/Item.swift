//
//  Item.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

typealias EmptyClosure = () -> Void

protocol DataSourceItem {
    static var name: String { get }
    
    var selectionEnabled: Bool { get }
}

extension DataSourceItem {
    static var name: String {
        String(describing: self)
    }
    
    var selectionEnabled: Bool { false }
}

protocol SelectableDataSourceItem: DataSourceItem {
    var onSelect: EmptyClosure { get set }
}

extension SelectableDataSourceItem {
    var selectionEnabled: Bool { true }
}
