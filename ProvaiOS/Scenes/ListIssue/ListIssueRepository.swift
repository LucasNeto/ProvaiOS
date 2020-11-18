//
//  ListIssueRepository.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

protocol ListIssueRepositoryProtocol {
    func getIssues(completion: @escaping ((Result<[Issue], ServiceError>)->()))
}
class ListIssueRepository: ListIssueRepositoryProtocol {
    
    private var service:IssueServiceProtocol = IssueService()
    
    func getIssues(completion: @escaping ((Result<[Issue], ServiceError>)->())) {
        let request = ListIssueRequest()
        service.doRequest(request) { (response:[Issue]?, error) in
            if let response = response {
                completion(.success(response))
            }else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
