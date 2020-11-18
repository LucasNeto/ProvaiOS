//
//  ServiceError.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

class ServiceError: Error {
    
    
    func getMessage() -> String {
        return "Estamos com problemas, tente novamente mais tarde."
    }
}
