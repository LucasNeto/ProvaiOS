//
//  Assignee.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import Foundation
// MARK: - Assignee
struct Assignee: Codable {
    let avatarURL: String?
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}
