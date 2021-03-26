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

struct UserViewModel: ViewModel {
    let user: User
}

struct ProfileInfoViewModel: ViewModel {
    let user: User
    
    func firstName() -> String {
        user.firstName
    }
    
    func lastName() -> String {
        user.lastName ?? ""
    }
}

final class ProfileAboutViewModel: ViewModel {
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

struct ProfileActionViewModel: SelectableViewModel {
    let name: String
    var onSelect: EmptyClosure
}

struct ProfileSection: DataSourceSection {
    let items: [ViewModel]
}

struct FriendsSection: DataSourceSection {
    var items: [ViewModel]
}
