//
//  Issue.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import Foundation

// MARK: - Issue
struct Issue: Codable {
    let state, title, body: String?
    let createdAt, updatedAt: String?
    let user: Assignee?
    let htmlURL: String?
    
    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case state, title, body, user
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

