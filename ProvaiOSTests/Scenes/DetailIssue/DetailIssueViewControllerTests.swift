//
//  DetailIssueViewControllerTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class DetailIssueViewControllerTests: XCTestCase {

    var sut:DetailIssueViewControllerProtocol!
    
    override func setUp() {
        sut = DetailIssueViewController()
    }
    override func tearDown() {
        sut = nil
    }

    func testDisplayIssues(){
        let viewModel = DetailIssueModel.ViewModel(title: "titulo",
                                                   description: "descricao",
                                                   imageUrl: "url",
                                                   dataCreated: "101010")
        sut.displayIssue(viewModel: viewModel)
    }
    

}
