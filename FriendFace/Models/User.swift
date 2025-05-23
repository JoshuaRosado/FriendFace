//
//  User.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class User: Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags : [String]
    var friends: [Friend]
    
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
   
    
}




//"id": "50a48fa3-2c0f-4397-ac50-64da464f9954",
//"isActive": false,
//"name": "Alford Rodriguez",
//"age": 21,
//"company": "Imkan",
//"email": "alfordrodriguez@imkan.com",
//"address": "907 Nelson Street, Cotopaxi, South Dakota, 5913",
//"about": "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
//"registered": "2015-11-10T01:47:18-00:00",
//"tags": [
//    "cillum",
//    "consequat",
//    "deserunt",
//    "nostrud",
//    "eiusmod",
//    "minim",
//    "tempor"
//],
//"friends":
