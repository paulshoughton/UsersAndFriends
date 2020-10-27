//
//  UserList.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 25/10/2020.
//

import SwiftUI

struct UserList: View {
    @ObservedObject var users: Users
    
    var body: some View {
        List {
            ForEach(users.userArray, id: \.id) { user in
                UserRow(users: users, user: user)
            }
        }
        .navigationBarTitle(Text("Users"))
        
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUsers: Users = Users(userArray: [User]())
        
        let userPaul = User(
            id: "1",
            isActive: true,
            name: "Paul Houghton",
            age: 45,
            company: "Bentley Systems",
            email: "paul.houghton@bentley.com",
            address: "221B Baker Street",
            about: "A super detective.",
            friends: [Friend]()
        )
        
        sampleUsers.userArray.append(userPaul)
        
        return NavigationView {
            UserList(users: sampleUsers)
        }
    }
}
