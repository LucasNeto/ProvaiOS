//
//  ListRepoModel.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

enum ListRepoModel {
    
    struct ViewModel {
        var list: [RepoResumed]
    }
    struct RepoResumed {
        var name: String
        var starsCount: Int
        var imageUrl: String
        var authorName: String
    }
}
