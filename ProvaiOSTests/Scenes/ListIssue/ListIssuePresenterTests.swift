//
//  ListIssuePresenterTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class ListIssuePresenterTests: XCTestCase {

    var sut: ListIssuePresenterProtocol!
    var spy: ListIssueTableViewControllerSpy!
    var repositorySpy: ListIssueRepositorySpy!
    
    override func setUp() {
        repositorySpy = ListIssueRepositorySpy()
        spy = ListIssueTableViewControllerSpy()
        sut = ListIssuePresenter(spy, repository: repositorySpy)
    }
    override func tearDown() {
        sut = nil
        spy = nil
        repositorySpy = nil
    }

    func testGetListIssue() {
        sut.getListIssue()
        XCTAssert(repositorySpy.getIssuesCalled, "Repository method getIssues() should be called")
        XCTAssert(spy.displayIssuesCalled, "ViewController method displayIssues() should be called")
    }
    
    func testSelectIndex() {
        sut.getListIssue()
        sut.select(index: 0)
        XCTAssert(repositorySpy.getIssuesCalled, "Repository method getIssues() should be called")
        XCTAssert(spy.displayIssuesCalled, "ViewController method displayIssues() should be called")
        XCTAssert(spy.goToDetailCalled, "ViewController method goToDetail() should be called")
    }
    
}
