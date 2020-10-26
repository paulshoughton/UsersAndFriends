//
//  UserRow.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 26/10/2020.
//

import SwiftUI

struct UserRow: View {
    var user: User
    
    var body: some View {
        NavigationLink(destination: UserDetail(user: user) ) {
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
        
        return List {
            UserRow(user: userPaul)
        }
    }
}
