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
    var showLoadingCalled = false
    var hideLoadingCalled = false
    
    func displayRepos(_ viewModel: ListRepoModel.ViewModel){
        self.displayReposCalled = true
    }
    func displayError(_ message: String){
        self.displayErrorCalled = true
    }
    func showLoading(){
        self.showLoadingCalled = true
    }
    func hideLoading(){
        self.hideLoadingCalled = true
    }
}
