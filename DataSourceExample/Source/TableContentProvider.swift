//
//  TableContentProvider.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

extension UITableView {
    final func register<T: UITableViewCell>(
        _ cellType: T.Type,
        tag: String? = nil
    ) {
        let reuseIdentifier = tag != nil
            ? "\(cellType.reuseIdentifier)_\(tag!)"
            : cellType.reuseIdentifier
        
        register(
            cellType.self,
            forCellReuseIdentifier: reuseIdentifier
        )
    }
}

final class TableContentProvider<
    TableView: UITableView
>: NSObject, UITableViewDataSource, UITableViewDelegate {
    let dataSource: DataSource
    let decorators: CellDecorators
    weak var tableView: UITableView?
    
    init(
        dataSource: DataSource,
        decorators: CellDecorators,
        tableView: UITableView
    ) {
        self.dataSource = dataSource
        self.decorators = decorators
        self.tableView = tableView
        
        super.init()
        
        configure()
    }
    
    private func configure() {
        for decorator in decorators.all() {
            tableView?.register(decorator.cell as! UITableViewCell.Type)
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
        let decorator = decorators.decorator(for: item)
        let cell = tableView.dequeueReusableCell(
            withIdentifier: decorator.cell.reuseIdentifier,
            for: indexPath
        )
        
        cell.selectionStyle = item.selectionEnabled ? .default : .none
        
        decorator.execute(for: cell, with: item)
        
        return cell
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
