//
//  ReusableViewConfig+CollectionView.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 28.03.2021.
//

import UIKit

extension UICollectionView: ReusableViewConfig {
    func registerItem(
        with decorator: ViewDecoratorContext
    ) {
        ReusableViewAnyContext(decorator).apply { context in
            register(
                context.type,
                forCellWithReuseIdentifier: context.reuseIdentifier
            )
        }
    }
    
    func registerHeader(
        with decorator: ViewDecoratorContext
    ) {
        ReusableViewAnyContext(decorator).apply { context in
            register(
                context.type,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: context.reuseIdentifier
            )
        }
    }
    
    func registerFooter(
        with decorator: ViewDecoratorContext
    ) {
        ReusableViewAnyContext(decorator).apply { context in
            register(
                context.type,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: context.reuseIdentifier
            )
        }
    }
    
    func dequeue(
        item: DataSourceItem,
        with decorator: ViewDecoratorContext,
        at indexPath: IndexPath
    ) -> UICollectionViewCell {
        ReusableViewContext(decorator).transform { context in
            let cell = dequeueReusableCell(
                withReuseIdentifier: context.reuseIdentifier,
                for: indexPath
            )
            
            decorator.execute(for: cell, with: item)
            
            return cell
        }
    }
}
