//
//  TableContentProvider.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

final class TableContentProvider<
    TableView: UITableView
>: NSObject, UITableViewDataSource, UITableViewDelegate {
    let dataSource: DataSource
    let decorators: ViewDecorators
    weak var tableView: UITableView?
    
    init(
        dataSource: DataSource,
        decorators: ViewDecorators,
        tableView: UITableView
    ) {
        self.dataSource = dataSource
        self.decorators = decorators
        self.tableView = tableView
        
        super.init()
        
        configure()
    }
    
    private func configure() {
        tableView.flatMap {
            decorators.items.forEach($0.registerItem(with:))
            decorators.headers.forEach($0.registerHeader(with:))
            decorators.footers.forEach($0.registerFooter(with:))
        }
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func reloadData() {
        tableView?.reloadData()
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.item(at: indexPath)
        let decorator = decorators.itemDecorator(for: item)
        
        return tableView.dequeue(
            item: item,
            with: decorator,
            at: indexPath
        )
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.item(at: indexPath)
        
        (item as? SelectableViewModel).flatMap {
            $0.onSelect()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
