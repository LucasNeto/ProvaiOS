//
//  ListRepoRequest.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

class ListRepoRequest: BaseRequest {
    var page: Int
    init(page: Int){
        self.page = page
    }
    var url: String {
        get {
            return "https://api.github.com/search/repositories?q=language:swift&per_page=30&page=\(page)"
        }
    }
}
