//
//  DetailIssueControllerSpy.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

@testable import ProvaiOS

class DetailIssueControllerSpy : DetailIssueViewControllerProtocol {
    var displayIssueCalled = false
    
    func displayIssue(viewModel: DetailIssueModel.ViewModel){
        displayIssueCalled = true
    }
    
}
