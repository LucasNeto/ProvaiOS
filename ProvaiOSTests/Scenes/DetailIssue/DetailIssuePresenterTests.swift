//
//  DetailIssuePresenterTests.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import XCTest
@testable import ProvaiOS

class DetailIssuePresenterTests: XCTestCase {

    var sut: DetailIssuePresenterProtocol!
    var spy: DetailIssueControllerSpy!
    
    override func setUp() {
        spy = DetailIssueControllerSpy()
        sut = DetailIssuePresenter(spy)
    }
    override func tearDown() {
        sut = nil
        spy = nil
    }
    
    func testSetIssue(){
        sut.setIssue(ListIssueModelMock.detail)
        XCTAssert(spy.displayIssueCalled, "ViewController method displayIssue() should be called")
    }
    func testOpenSite(){
        sut.openSiteIssue()
    }
}
