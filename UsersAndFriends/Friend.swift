//
//  Friend.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 25/10/2020.
//

import Foundation

class Friend: Codable, Identifiable {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
