//
//  TestControllerViewModel.swift
//  DataSourceExample
//
//  Created by Andrew Kochulab on 24.03.2021.
//

import Foundation

struct TestControllerViewModel {
    let dataSource = AnyDataSource()
    
    init() {
        configure()
    }
    
    func configure() {
        let test1 = ProfileAboutViewModel(message: "About test1 message")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            test1.message = "About test1 - 2 message"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                test1.message = "About test1 - 3 message"
            }
        }
        
        
        let test2 = ProfileAboutViewModel(message: "About test2 - 1 message")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            test2.message = "About test2 - 2 message"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                test2.message = "About test2 - 3 message"
            }
        }
        
        dataSource.add(
            section: ProfileSection(
                items: [
                    ProfileInfoViewModel(user: User(firstName: "Steve", lastName: "Jobs")),
                    ProfileAboutViewModel(message: "About first message"),
                    test1,
                    test2,
                    ProfileInfoViewModel(user: User(firstName: "Walton", lastName: "James")),
                    ProfileInfoViewModel(user: User(firstName: "Charlie", lastName: "Hunnam")),
                    ProfileActionViewModel(name: "Test action", onSelect: {
                        print("Test operation")
                    })
                ]
            )
        )
        
        let friends = [
            User(firstName: "Robert", lastName: "Deniro"),
            User(firstName: "Jonathan", lastName: "Ive")
        ]
        
        dataSource.add(
            section: FriendsSection(
                list: friends.compactMap(ProfileInfoViewModel.init(user:))
            )
        )
    }
}
