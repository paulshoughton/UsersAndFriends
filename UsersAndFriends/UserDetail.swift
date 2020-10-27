//
//  UserDetail.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 26/10/2020.
//

import SwiftUI

struct UserDetail: View {
    @ObservedObject var users: Users
    var user: User
    
    var body: some View {
        VStack {
            Text("Age \(user.age)")
            Text("\(user.company)")
            Text("\(user.email)")
            Text("Address")
                .font(.headline)
            Text("\(user.address)")
            Text("\(user.about)")
            Text("Friends")
                .font(.headline)
            List {
                ForEach(user.friends) {friend in
                    if let userFriend = users.userArray.first(where: {$0.id == friend.id}) {
                        
                        VStack(alignment: .leading)  {
                            NavigationLink(destination: UserDetail(users: users, user: userFriend)) {
                                Text("\(friend.name)")
                                    .font(.headline)
                                Text("\(userFriend.company)")
                            }
                        }
                    }
                    else {
                        VStack(alignment: .leading) {
                            Text("\(friend.name)")
                                .font(.headline)
                        }
                    }
                }
            }
            .padding(0)
            
        }
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
}

struct UserDetail_Previews: PreviewProvider {
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
            friends: [Friend](arrayLiteral: Friend(id: "2", name: "Shane Donnelly"))
        )
        
        let userShane = User(
            id: "2",
            isActive: true,
            name: "Shane Donnelly",
            age: 45,
            company: "Bentley Systems",
            email: "shane.donnelly@bentley.com",
            address: "221A Baker Street",
            about: "A super detective assistant.",
            friends: [Friend]()
        )
        
        sampleUsers.userArray.append(userPaul)
        sampleUsers.userArray.append(userShane)
        
        return NavigationView {
            UserDetail(users: sampleUsers, user: userPaul)
        }
    }
}
