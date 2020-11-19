//
//  ListRepoRequest.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

class ListRepoRequest: BaseRequest {
    var url: String {
        get {
//            return "https://api.github.com/repos/apple/swift/issues"
            return "https://api.github.com/search/repositories?q=language:swift&sort=stars"
        }
    }
}
