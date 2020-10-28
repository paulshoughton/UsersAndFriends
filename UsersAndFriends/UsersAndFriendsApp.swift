//
//  UsersAndFriendsApp.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 22/10/2020.
//

import SwiftUI

@main
struct UsersAndFriendsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
