////
////  User.swift
////  FriendFace
////
////  Created by Joshua Rosado Olivencia on 5/10/25.
////
//
//import Foundation
//import SwiftData
//import SwiftUI
//
//// From Struct, update to be a Class
//// Add @Model with SwiftData
//@Model
//final class User: Identifiable, Codable, Hashable {
//    var id: String
//    var isActive: Bool
//    var name: String
//    var age: Int
//    var company: String
//    var email: String
//    var address: String
//    var about: String
//    var registered: Date
//    var tags : [String]
//    var friends: [Friend]
//    
//    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
//        self.id = id
//        self.isActive = isActive
//        self.name = name
//        self.age = age
//        self.company = company
//        self.email = email
//        self.address = address
//        self.about = about
//        self.registered = registered
//        self.tags = tags
//        self.friends = friends
//    }
//    
//    enum CodingKeys: String, CodingKeys {
//        case id, isActive, name, age, company, email, address, about, registered, tags, friends
//    }
//    
//    required convenience init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        let id = try container.decode(String.self, forKey: .id)
//        let isActive = try container.decode(Bool.self, forKey: .isActive)
//                let name = try container.decode(String.self, forKey: .name)
//                let age = try container.decode(Int.self, forKey: .age)
//                let company = try container.decode(String.self, forKey: .company)
//                let email = try container.decode(String.self, forKey: .email)
//                let address = try container.decode(String.self, forKey: .address)
//                let about = try container.decode(String.self, forKey: .about)
//                let registered = try container.decode(Date.self, forKey: .registered)
//                let tags = try container.decode([String].self, forKey: .tags)
//                let friends = try container.decode([Friend].self, forKey: .friends)
//
//                self.init(id: id, isActive: isActive, name: name, age: age, company: company, email: email, address: address, about: about, registered: registered, tags: tags, friends: friends)
//    }
//   
//    
//}

import SwiftData
import SwiftUI
import Foundation


// Upgrade, @Model class
@Model
final class User: Identifiable,Decodable,Encodable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    
    // If a User is deleted , the user's friends will also be deleted
    @Relationship(deleteRule: .cascade) var friends: [Friend] = []

    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }

    enum CodingKeys: String, CodingKey {
        case id, isActive, name, age, company, email, address, about, registered, tags, friends
    }

    // Function that it customize how data is decoded
    // Instance of the User type from  JSON
    
    required convenience init(from decoder: Decoder) throws {
        // Create a keyed container, that uses CodingKeys from enum, for mapping property names to keys
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Manually decoding all properties from User
        let id = try container.decode(String.self, forKey: .id)
        let isActive = try container.decode(Bool.self, forKey: .isActive)
        let name = try container.decode(String.self, forKey: .name)
        let age = try container.decode(Int.self, forKey: .age)
        let company = try container.decode(String.self, forKey: .company)
        let email = try container.decode(String.self, forKey: .email)
        let address = try container.decode(String.self, forKey: .address)
        let about = try container.decode(String.self, forKey: .about)
        let registered = try container.decode(Date.self, forKey: .registered)
        let tags = try container.decode([String].self, forKey: .tags)
        let friends = try container.decode([Friend].self, forKey: .friends)

        self.init(id: id, isActive: isActive, name: name, age: age, company: company, email: email, address: address, about: about, registered: registered, tags: tags, friends: friends)
    }

    // Function that it customize how data is encoding
    // Instance of the User type into a JSON
    
    func encode(to encoder: Encoder) throws {
        // Create a keyed container, that uses CodingKeys from enum, for mapping property names to keys
        var container = encoder.container(keyedBy: CodingKeys.self)

        
        // Manually encoding all properties of the User
        
        try container.encode(id, forKey: .id)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)
        try container.encode(registered, forKey: .registered)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
    }

    //  Two User objects are considered equal if their id properties match
    // This is useful for comparing users in collections, filtering,duplicates, etc
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    // Defines how a User instance is hashed.

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
