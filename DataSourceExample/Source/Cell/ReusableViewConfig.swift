//
//  ReusableViewConfig.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 27.03.2021.
//

import UIKit

protocol ReusableViewConfig {
    func registerItem(
        with decorator: ViewDecoratorContext
    )
    
    func registerHeader(
        with decorator: ViewDecoratorContext
    )
    
    func registerFooter(
        with decorator: ViewDecoratorContext
    )
}

struct ReusableViewAnyContext { // only for enqueue
    let type: AnyClass
    let reuseIdentifier: String
    
    init(_ decorator: ViewDecoratorContext) {
        self.type = decorator.view
        self.reuseIdentifier = Swift.type(of: decorator).reuseIdentifier
    }
    
    func apply(to f: (Self) -> Void) {
        f(self)
    }
}

struct ReusableViewContext<Type: AnyObject> { // only for dequeue
    let type: Type.Type
    let reuseIdentifier: String
    
    init(_ decorator: ViewDecoratorContext) {
        self.type = decorator.view as! Type.Type
        self.reuseIdentifier = Swift.type(of: decorator).reuseIdentifier
    }
    
    func apply(to f: (Self) -> Void) {
        f(self)
    }
    
    func transform(to f: (Self) -> Type) -> Type {
        f(self)
    }
}
