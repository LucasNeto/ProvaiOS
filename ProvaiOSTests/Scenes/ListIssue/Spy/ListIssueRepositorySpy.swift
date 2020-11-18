//
//  ListIssueRepositorySpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import ProvaiOS

class ListIssueRepositorySpy : ListIssueRepositoryProtocol {
    var getIssuesCalled = false
    func getIssues(completion: @escaping ((Result<[Issue], ServiceError>) -> ())) {
        getIssuesCalled = true
        completion(.success(ListIssueModelMock.list))
    }
}
