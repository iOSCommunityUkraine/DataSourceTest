//
//  CellDecorators.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct CellDecorators {
    typealias Decorators = [String : CellDecoratorContext]
    
    let decorators: Decorators
    
    init(_ decorators: CellDecoratorContext...) {
        var content = Decorators()
        
        for decorator in decorators {
            content[decorator.item.name] = decorator
        }
        
        self.decorators = content
    }
    
    func all() -> [CellDecoratorContext] {
        Array(decorators.values)
    }
    
    func decorator(for item: ViewModel) -> CellDecoratorContext {
        decorators[type(of: item).name]!
    }
}
