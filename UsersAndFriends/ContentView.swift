//
//  ContentView.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 22/10/2020.
//

import CoreData
import SwiftUI

class Users: ObservableObject {
    @Published var userArray: [User]
    
//    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>

    
    init(userArray: [User]) {
        self.userArray = userArray
    }
    
}

struct ContentView: View {
    //@State private var users: [User] = [User]()
    @ObservedObject var users: Users = Users(userArray: [User]())
        
    var body: some View {
        NavigationView {
            UserList(users: users)
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users.userArray = decodedUsers
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
            
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
