//
//  DataSource.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

protocol DataSource {
    func numberOfSections() -> Int
    func section(at index: Int) -> AnyDataSourceSection
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> DataSourceItem
}

final class AnyDataSource: DataSource {
    private var sections = [AnyDataSourceSection]()
    
    func add(section: AnyDataSourceSection) {
        sections.append(section)
    }
    
    func numberOfSections() -> Int {
        sections.count
    }
    
    func section(at index: Int) -> AnyDataSourceSection {
        sections[index]
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.section(at: section).numberOfItems()
    }
    
    func item(at indexPath: IndexPath) -> DataSourceItem {
        section(at: indexPath.section).item(at: indexPath.item)
    }
}

final class ConcreteDataSource<
    Item,
    Section: DataSourceSection
>: DataSource where Section.Item == Item {
    private var sections = [Section]()
    
    func add(section: Section) {
        sections.append(section)
    }
    
    func numberOfSections() -> Int {
        sections.count
    }
    
    func section(at index: Int) -> AnyDataSourceSection {
        sections[index]
    }
    
    func section(at index: Int) -> Section {
        sections[index]
    }
    
    func numberOfItems(in section: Int) -> Int {
        self.section(at: section).numberOfItems()
    }
    
    func item(at indexPath: IndexPath) -> DataSourceItem {
        section(at: indexPath.section).item(at: indexPath.item)
    }
    
    func item(at indexPath: IndexPath) -> Item {
        section(at: indexPath.section).item(at: indexPath.item)
    }
}
