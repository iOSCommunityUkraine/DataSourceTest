//
//  ViewModel.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

typealias EmptyClosure = () -> Void

protocol ViewModel {
    static var name: String { get }
    
    var selectionEnabled: Bool { get }
}

extension ViewModel {
    static var name: String {
        String(describing: self)
    }
    
    var selectionEnabled: Bool { false }
}

protocol SelectableViewModel: ViewModel {
    var onSelect: EmptyClosure { get set }
}

extension SelectableViewModel {
    var selectionEnabled: Bool { true }
}
