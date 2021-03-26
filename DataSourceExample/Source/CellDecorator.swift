//
//  CellDecorator.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

protocol CellDecoratorContext {
    var cell: ReusableCell.Type { get }
    var item: ViewModel.Type { get }
    
    func execute(
        for cell: ReusableCell,
        with item: ViewModel
    )
}

extension CellDecoratorContext where Self: CellDecorator {
    var cell: ReusableCell.Type {
        Cell.self
    }
    
    var item: ViewModel.Type {
        Item.self
    }
    
    func execute(
        for cell: ReusableCell,
        with item: ViewModel
    ) {
        (cell as? Self.Cell).flatMap { cell in
            (item as? Self.Item).flatMap { item in
                decorate(cell: cell, with: item)
            }
        }
    }
}

protocol CellDecorator: CellDecoratorContext {
    associatedtype Cell: ReusableCell
    associatedtype Item: ViewModel
    
    func decorate(
        cell: Cell,
        with item: Item
    )
}
