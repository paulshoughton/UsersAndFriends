//
//  UserList.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 25/10/2020.
//

import SwiftUI

struct UserList: View {
    var users: [User]
    
    var body: some View {
        List {
            ForEach(users, id: \.id) { user in
                Text("\(user.name)")
            }
        }
        .navigationTitle(Text("Users"))
        
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        var sampleUsers: [User] = [User]()
        
        let userPaul = User(
            id: "1",
            isActive: true,
            name: "Paul Houghton",
            age: 45,
            company: "Bentley Systems",
            email: "paul.houghton@bentley.com",
            friends: [Friend]()
        )
        
        sampleUsers.append(userPaul)
        
        return NavigationView {
            UserList(users: sampleUsers)
        }
    }
}
