//
//  TestContent.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String?
}

struct UserViewModel: DataSourceItem {
    let user: User
}

struct ProfileInfoViewModel: DataSourceItem {
    let user: User
    
    func firstName() -> String {
        user.firstName
    }
    
    func lastName() -> String {
        user.lastName ?? ""
    }
}

final class ProfileAboutViewModel: DataSourceItem {
    var message: String {
        didSet {
            didChange?(message)
        }
    }
    
    var didChange: ((String) -> Void)?
    
    init(message: String) {
        self.message = message
    }
}

struct ProfileActionViewModel: SelectableDataSourceItem {
    let name: String
    var onSelect: EmptyClosure
}

struct ProfileSection: AnyDataSourceSection {
    let items: [DataSourceItem]
}

struct FriendsSection: DataSourceSection {
    var list: [ProfileInfoViewModel]
}

struct ProfileHeaderViewModel: DataSourceHeader {
    let title: String
}
