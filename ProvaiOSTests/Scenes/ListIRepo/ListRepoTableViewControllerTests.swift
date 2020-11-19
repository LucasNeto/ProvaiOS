//
//  ListRepoTableViewControllerTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class ListRepoTableViewControllerTests: XCTestCase {

    var sut: ListRepoTableViewController!
    var spy: ListRepoInteractorSpy!
    
    override func setUp() {
        spy = ListRepoInteractorSpy()
        sut = ListRepoTableViewController()
        sut.interactor = spy
        
    }
    override func tearDown() {
        sut = nil
        spy = nil
    }
    func testDisplayRepos(){
        sut.displayRepos(ListRepoModelMock.viewModel)
    }
    func testDisplayError(){
        sut.displayError("erro")
    }
    // MARK: - TableView
    func testCellForIndex(){
        sut.displayRepos(ListRepoModelMock.viewModel)
        let _ = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
    }
    func testrefresh(){
        sut.refresh(sender: NSObject())
        XCTAssert(spy.getReposCalled, "Interactor method getRepos should be called")
    }
}

