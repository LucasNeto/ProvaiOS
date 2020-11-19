//
//  ListRepoRepository.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

protocol ListRepoRepositoryProtocol {
    func getRepos(completion: @escaping ((Result<[RepoItem], ServiceError>)->()))
}
class ListRepoRepository: ListRepoRepositoryProtocol {
    
    private var service:GitServiceProtocol = GitService()
    
    func getRepos(completion: @escaping ((Result<[RepoItem], ServiceError>)->())) {
        let request = ListRepoRequest()
        service.doRequest(request) { (response:Repos?, error) in
            if let response = response {
                completion(.success(response.items ?? []))
            }else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
