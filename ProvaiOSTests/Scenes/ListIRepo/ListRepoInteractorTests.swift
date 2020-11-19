//
//  ListRepoInteractorTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 18/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class ListRepoInteractorTests: XCTestCase {

    var sut: ListRepoInteractorProtocol!
    var repositorySpy: ListRepoRepositorySpy!
    var spy: ListRepoPresenterSpy!
    
    override func setUp() {
        repositorySpy = ListRepoRepositorySpy()
        spy = ListRepoPresenterSpy()
        sut = ListRepoInteractor(repository: repositorySpy, presenter: spy)
    }

    override func tearDown() {
        sut = nil
        spy = nil
        repositorySpy = nil
    }

    func testGetReposWithSuccess() {
        sut.getRepos()
        XCTAssert(spy.presentListRepoCalled, "Presenter method presentListRepo() should be called")
    }
    
    func testGetReposWithFailure() {
        //given
        repositorySpy.shouldReturnSuccess = false
        sut = ListRepoInteractor(repository: repositorySpy, presenter: spy)
        
        //then
        sut.getRepos()
        XCTAssert(spy.presentErrorCalled, "Presenter method presentError() should be called")
    }

}
