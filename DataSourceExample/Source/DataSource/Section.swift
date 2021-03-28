//
//  Section.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

protocol AnyDataSourceSection {
    var items: [DataSourceItem] { get }
    
    func numberOfItems() -> Int
    func item(at index: Int) -> DataSourceItem
}

extension AnyDataSourceSection {
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> DataSourceItem {
        items[index]
    }
}

protocol DataSourceSection: AnyDataSourceSection {
    associatedtype Item: DataSourceItem

    var list: [Item] { get }

    func numberOfItems() -> Int
    func item(at index: Int) -> Item
}

extension DataSourceSection {
    var items: [DataSourceItem] {
        list
    }
    
    func item(at index: Int) -> Item {
        list[index]
    }
}
