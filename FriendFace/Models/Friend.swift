//
//  Friend.swift
//  FriendFace
//
//  Created by Joshua Rosado Olivencia on 5/10/25.
//
//

import Foundation
import SwiftData

@Model
final class Friend: Identifiable,Decodable,Encodable, Hashable {
    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }


    enum CodingKeys: String, CodingKey {
        case id, name
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        self.init(id: id, name: name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }


    static func == (lhs: Friend, rhs: Friend) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
