//
//  ListRepoInteractorSpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 18/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import Foundation
@testable import ProvaiOS

class ListRepoInteractorSpy : ListRepoInteractorProtocol {
    var getReposCalled = false
    
    func getRepos() {
        self.getReposCalled = true
    }
}
