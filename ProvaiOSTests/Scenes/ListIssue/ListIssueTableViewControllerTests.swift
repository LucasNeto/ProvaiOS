//
//  ListIssueTableViewControllerTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class ListIssueTableViewControllerTests: XCTestCase {

    var sut: ListIssueTableViewController!
    
    override func setUp() {
        sut = ListIssueTableViewController()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testDisplayIssues(){
        sut.displayIssues(ListIssueModelMock.viewModel)
    }
    
    func testDisplayError(){
        sut.displayError("erro")
    }

    func testGoToDetail(){
        sut.goToDetail(ListIssueModelMock.detail)
    }
    
    // MARK: - TableView
    func testCellForIndex(){
        sut.displayIssues(ListIssueModelMock.viewModel)
        let _ = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
    }
    func testDidSelectRowAt(){
        sut.displayIssues(ListIssueModelMock.viewModel)
        let _ = sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }
}
