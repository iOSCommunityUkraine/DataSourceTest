//
//  Section.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

protocol DataSourceSection {
    var items: [ViewModel] { get }
    
    func numberOfItems() -> Int
    func item(at index: Int) -> ViewModel
}

extension DataSourceSection {
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> ViewModel {
        items[index]
    }
}
