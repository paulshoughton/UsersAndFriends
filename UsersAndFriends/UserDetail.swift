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
        VStack(alignment: .leading) {

            Section {
                Text("\(user.about)")
                    .padding(.top)
                
                Link("\(user.email)", destination: URL(string: "mailto:\(user.email)")!)
                
                HStack {
                    Text("Age")
                        .font(.headline)
                    Spacer()
                    Text("\(user.age)")
                }
                
                HStack {
                    Text("Company")
                        .font(.headline)
                    Spacer()
                    Text("\(user.company)")
                }
                
                HStack {
                    Text("Address")
                        .font(.headline)
                    Spacer()
                    Text("\(user.address)")
                }
            }
            .padding([.leading, .trailing, .bottom], /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text("Friends")
                    .font(.title2)
                    .padding(.all)
                Spacer()
            }
            .background(Color(.lightGray))
            
            Section {

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
            }
            .padding()
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
