//
//  GitService.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import Alamofire

protocol GitServiceProtocol {
    func doRequest<T:Codable>( _ request: BaseRequest, completion: @escaping((T?,ServiceError?)->()))
}
class GitService: GitServiceProtocol {
    func doRequest<T:Codable>( _ request: BaseRequest, completion: @escaping((T?,ServiceError?)->())){
        let url = request.url
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                do{
                    let response : T? = try JSONDecoder().decode(T.self, from: data)
                    completion(response,nil)
                }catch{
                    completion(nil,ServiceError())
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
                completion(nil,ServiceError())
            }
        }
    }
}
