//
//  ListRepoTableViewControllerSpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
@testable import ProvaiOS

class ListRepoTableViewControllerSpy: ListRepoTableViewControllerProtocol {
    
    var displayReposCalled = false
    var displayErrorCalled = false
    func displayRepos(_ viewModel: ListRepoModel.ViewModel){
        self.displayReposCalled = true
    }
    func displayError(_ message: String){
        self.displayErrorCalled = true
    }
    
}
