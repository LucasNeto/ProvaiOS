//
//  ListIssueTableViewControllerSpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
@testable import ProvaiOS

class ListIssueTableViewControllerSpy: ListIssueTableViewControllerProtocol {
    
    var displayIssuesCalled = false
    var displayErrorCalled = false
    var goToDetailCalled = false
    
    
    func displayIssues(_ viewModel: ListIssueModel.ViewModel) {
        self.displayIssuesCalled = true
    }
    func displayError(_ message: String) {
        self.displayErrorCalled = true
    }
    func goToDetail(_ issue: Issue) {
        self.goToDetailCalled = true
    }
    
}
