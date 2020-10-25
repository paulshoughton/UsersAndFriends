//
//  User.swift
//  UsersAndFriends
//
//  Created by Paul Houghton on 25/10/2020.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    
    var friends: [Friend]
    
    
}
