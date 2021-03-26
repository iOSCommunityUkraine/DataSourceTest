//
//  DataSource.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

final class DataSource {
    private var sections = [DataSourceSection]()
    
    func add(section: DataSourceSection) {
        sections.append(section)
    }
    
    func numberOfSections() -> Int {
        sections.count
    }
    
    func section(at index: Int) -> DataSourceSection {
        sections[index]
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.section(at: section).numberOfItems()
    }
    
    func item(at indexPath: IndexPath) -> ViewModel {
        section(at: indexPath.section).item(at: indexPath.item)
    }
}
