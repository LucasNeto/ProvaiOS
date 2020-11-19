//
//  Repos.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 18/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

struct Repos: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [RepoItem]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
// MARK: - Item
struct RepoItem: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let itemDescription: String?
    let homepage: String?
    let stargazersCount: Int?
    let language: Language?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case itemDescription = "description"
        case homepage
        case stargazersCount = "stargazers_count"
        case language
        case score
    }
}

enum Language: String, Codable {
    case swift = "Swift"
}
