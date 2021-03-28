//
//  ViewDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

protocol ViewDecoratorContext {
    static var reuseIdentifier: String { get }
    
    var view: ReusableView.Type { get }
    var item: DataSourceItem.Type { get }
    
    func execute(
        for view: ReusableView,
        with item: DataSourceItem
    )
    
    func height(
        with item: DataSourceItem,
        in tableView: UITableView
    ) -> CGFloat
}

extension ViewDecoratorContext where Self: ViewDecorator {
    var view: ReusableView.Type {
        View.self
    }
    
    var item: DataSourceItem.Type {
        Item.self
    }
    
    func execute(
        for view: ReusableView,
        with item: DataSourceItem
    ) {
        decorate(view: view as! View, with: item as! Item)
    }
    
    func height(
        with item: DataSourceItem,
        in tableView: UITableView
    ) -> CGFloat {
        var item = item as! Item
        
        return height(for: &item, in: tableView)
    }
}

protocol ViewDecorator: ViewDecoratorContext {
    associatedtype View: ReusableView
    associatedtype Item: DataSourceItem
    
    func height(
        for item: inout Item,
        in tableView: UITableView
    ) -> CGFloat
    
    func decorate(
        view: View,
        with item: Item
    )
}

extension ViewDecorator {
    static var reuseIdentifier: String {
        View.reuseIdentifier
    }
    
    func height(
        for item: inout Item,
        in tableView: UITableView
    ) -> CGFloat {
        if let height = item.height {
            return height
        }

        let height = UITableView.automaticDimension
        item.height = height

        return height
    }
}
