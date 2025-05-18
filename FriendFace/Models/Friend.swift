//
//  Friend.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//

import Foundation
import SwiftUI

struct Friend: Identifiable, Codable, Hashable {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
