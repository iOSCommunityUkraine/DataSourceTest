//
//  ViewDecorators.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

final class ViewDecorators {
    private typealias Content = [String : ViewDecoratorContext]
    
    private let itemDecorators: Content
    private var headerDecorators = Content()
    private var footerDecorators = Content()
    
    private(set) lazy var items = [ViewDecoratorContext]()
    private(set) lazy var headers = [ViewDecoratorContext]()
    private(set) lazy var footers = [ViewDecoratorContext]()
    
    init(_ decorators: ViewDecoratorContext...) {
        itemDecorators = ViewDecorators.content(from: decorators)
    }
    
    func inject(headers: ViewDecoratorContext...) -> Self {
        headerDecorators = ViewDecorators.content(from: headers)
        
        return self
    }
    
    func inject(footers: ViewDecoratorContext...) -> Self {
        footerDecorators = ViewDecorators.content(from: footers)
        
        return self
    }
    
    func bootstrap() -> Self {
        items = Array(itemDecorators.values)
        headers = Array(headerDecorators.values)
        footers = Array(footerDecorators.values)
        
        return self
    }
    
    func itemDecorator(for item: DataSourceItem) -> ViewDecoratorContext {
        context(for: item, in: itemDecorators)
    }
    
    func headerDecorator(for item: DataSourceItem) -> ViewDecoratorContext {
        context(for: item, in: headerDecorators)
    }
    
    func footerDecorator(for item: DataSourceItem) -> ViewDecoratorContext {
        context(for: item, in: footerDecorators)
    }
    
    private func context(for item: DataSourceItem, in list: Content) -> ViewDecoratorContext {
        guard let decorator = list[type(of: item).name] else {
            preconditionFailure("Must register a decorator for \(type(of: item)) type")
        }
        
        return decorator
    }
    
    private static func content(
        from decorators: [ViewDecoratorContext]
    ) -> Content {
        var content = Content()
        
        for decorator in decorators {
            content[decorator.item.name] = decorator
        }
        
        return content
    }
}
