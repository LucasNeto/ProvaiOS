//
//  ListRepoModelMock.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
@testable import ProvaiOS

class ListRepoModelMock {
    
    static var viewModel = ListRepoModel.ViewModel(list: [repoResumed,repoResumed])
    static var repoResumed = ListRepoModel.RepoResumed(name: "name", starsCount: 5, imageUrl: "", authorName: "Nome")
    
    static var list: [RepoItem] = [
        item,
        item
    ]
    static var item: RepoItem = RepoItem(id: 0, nodeID: "", name: "", fullName: "", itemPrivate: false, owner: nil, htmlURL: "", itemDescription: "", homepage: "", stargazersCount: 5, language: nil, score: 1)
}


