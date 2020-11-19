//
//  ListRepoRepositorySpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import ProvaiOS

class ListRepoRepositorySpy : ListRepoRepositoryProtocol {
    var getReposCalled = false
    var shouldReturnSuccess = true
    
    func getRepos(page: Int, completion: @escaping ((Result<[RepoItem], ServiceError>)->())) {
        getReposCalled = true
        if shouldReturnSuccess {
            completion(.success(ListRepoModelMock.list))
        }else{
            completion(.failure(ServiceError()))
        }
        
    }
}
