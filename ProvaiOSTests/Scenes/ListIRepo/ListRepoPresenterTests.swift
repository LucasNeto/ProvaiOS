//
//  ListRepoPresenterTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class ListRepoPresenterTests: XCTestCase {

    var sut: ListRepoPresenterProtocol!
    var spy: ListRepoTableViewControllerSpy!
    
    override func setUp() {
        spy = ListRepoTableViewControllerSpy()
        sut = ListRepoPresenter(spy)
    }
    override func tearDown() {
        sut = nil
        spy = nil
    }
    
    func testPresentListRepo(){
        sut.presentListRepo(list: ListRepoModelMock.list)
        XCTAssert(spy.displayReposCalled, "ViewController method displayRepos() should be called")
    }
    func testPresentError(){
        sut.presentError(error: "Error")
        XCTAssert(spy.displayErrorCalled, "ViewController method displayError() should be called")
    }
    
}
