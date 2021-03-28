//
//  ReusableViewConfig+TableView.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 28.03.2021.
//

import UIKit

extension UITableView: ReusableViewConfig {
    func registerItem(
        with decorator: ViewDecoratorContext
    ) {
        ReusableViewAnyContext(decorator).apply { context in
            register(
                context.type,
                forCellReuseIdentifier: context.reuseIdentifier
            )
        }
    }
    
    func registerHeader(
        with decorator: ViewDecoratorContext
    ) {
        registerHeaderFooter(with: decorator)
    }
    
    func registerFooter(
        with decorator: ViewDecoratorContext
    ) {
        registerHeaderFooter(with: decorator)
    }
    
    private func registerHeaderFooter(
        with decorator: ViewDecoratorContext
    ) {
        ReusableViewAnyContext(decorator).apply { context in
            register(
                context.type,
                forHeaderFooterViewReuseIdentifier: context.reuseIdentifier
            )
        }
    }
    
    func dequeue(
        item: DataSourceItem,
        with decorator: ViewDecoratorContext,
        at indexPath: IndexPath
    ) -> UITableViewCell {
        ReusableViewContext(decorator).transform { context in
            let cell = dequeueReusableCell(
                withIdentifier: context.reuseIdentifier,
                for: indexPath
            )
            
            cell.selectionStyle = item.selectionEnabled ? .default : .none
            
            decorator.execute(for: cell, with: item)
            
            return cell
        }
    }
}
