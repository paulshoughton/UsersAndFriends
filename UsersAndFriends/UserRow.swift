//
//  UserRow.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 26/10/2020.
//

import SwiftUI

struct UserRow: View {
    @ObservedObject var users: Users
    var user: User
    
    var body: some View {
        NavigationLink(destination: UserDetail(users: users, user: user) ) {
            VStack(alignment: .leading) {
                Text("\(user.name)")
                    .font(.headline)
                Text("\(user.company)")
                    .font(.subheadline)
            }
        }
    }
    
}

struct UserRow_Previews: PreviewProvider {
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
        
        return List {
            UserRow(users: sampleUsers, user: userPaul)
        }
    }
}
