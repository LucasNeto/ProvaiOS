//
//  ListRepoPresenterSpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 18/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import ProvaiOS

class ListRepoPresenterSpy : ListRepoPresenterProtocol {
    
    var presentListRepoCalled = false
    var presentErrorCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    
    func presentListRepo(list: [RepoItem]){
        self.presentListRepoCalled = true
    }
    func presentError(error: String){
        self.presentErrorCalled = true
    }
    func showLoading(){
        self.showLoadingCalled = true
    }
    func hideLoading(){
        self.hideLoadingCalled = true
    }
}
