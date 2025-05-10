//
//  Friend.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//

import Foundation
import SwiftUI

struct Friend: Codable, Identifiable {
    var id = UUID()
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
