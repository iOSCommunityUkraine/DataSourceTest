//
//  ViewDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

protocol ViewDecoratorContext {
    static var reuseIdentifier: String { get }
    
    var view: ReusableView.Type { get }
    var item: DataSourceItem.Type { get }
    
    func execute(
        for view: ReusableView,
        with item: DataSourceItem
    )
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
        // FIXME: Check posibilities to fix (item as? Item) call
        
        (view as? View).flatMap { view in
            (item as? Item).flatMap { item in
                decorate(view: view, with: item)
            }
        }
    }
}

protocol ViewDecorator: ViewDecoratorContext {
    associatedtype View: ReusableView
    associatedtype Item: DataSourceItem
    
    func decorate(
        view: View,
        with item: Item
    )
}

extension ViewDecorator {
    static var reuseIdentifier: String {
        View.reuseIdentifier
    }
}
