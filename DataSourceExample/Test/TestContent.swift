//
//  TestContent.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import UIKit

struct User {
    let firstName: String
    let lastName: String?
}

struct UserViewModel: DataSourceItem {
    let user: User
    var height: CGFloat? = nil
}

struct ProfileInfoViewModel: DataSourceItem {
    let user: User
    var height: CGFloat? = nil
    
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
    
    var height: CGFloat? = nil
    
    var didChange: ((String) -> Void)?
    
    init(message: String) {
        self.message = message
    }
}

struct ProfileActionViewModel: SelectableDataSourceItem {
    let name: String
    var onSelect: EmptyClosure
    
    var height: CGFloat? = nil
}

struct ProfileSection: AnyDataSourceSection {
    let items: [DataSourceItem]
}

struct FriendsSection: DataSourceSection {
    var list: [ProfileInfoViewModel]
}
