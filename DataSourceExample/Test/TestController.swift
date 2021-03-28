//
//  TestController.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

final class TestController: UIViewController {
    private let viewModel: TestControllerViewModel
    private lazy var tableView = UITableView()
    private lazy var contentProvider = TableContentProvider(
        dataSource: viewModel.dataSource,
        decorators: ViewDecorators(
            ProfileInfoCellDecorator(),
            ProfileAboutCellDecorator(),
            ProfileActionCellDecorator()
        ).bootstrap(),
        tableView: tableView
    )
    
    init(viewModel: TestControllerViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentProvider.reloadData()
    }
}

