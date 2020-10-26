//
//  UserDetail.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 26/10/2020.
//

import SwiftUI

struct UserDetail: View {
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
            Spacer()
            Section(header: Text("Friends")) {
                List {
                    ForEach(user.friends) { friend in
                        Text("\(friend.name)")
                    }
                }
            }
        }
        .navigationBarTitle("\(user.name)", displayMode: .inline)
    }
}

struct UserDetail_Previews: PreviewProvider {
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
        
        return NavigationView {
            UserDetail(user: userPaul)
        }
    }
}
