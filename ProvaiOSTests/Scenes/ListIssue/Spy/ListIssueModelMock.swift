//
//  ListIssueModelMock.swift
//  ProvaiOSTests
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
@testable import ProvaiOS

class ListIssueModelMock {
    
    static var viewModel = ListIssueModel.ViewModel(list: [issueResumed,issueResumed])
    static var issueResumed = ListIssueModel.IssueResumed(title: "Titulo", state: .open)
    static var list: [Issue] = [
        detail,
        detail
    ]
    static var detail: Issue = Issue(state: "open",
                                     title: "Titulo",
                                     body: "descricao",
                                     createdAt: "2011-04-22T13:33:48Z",
                                     updatedAt: "2011-04-22T13:33:48Z",
                                     user: Assignee(avatarURL: "https://avatars2.githubusercontent.com/u/13806068?s=460&u=1ab3b0838bf75c27119819f74a5e3efbf0eda809&v=4"),
                                     htmlURL: "https://github.com/apple/swift/pull/31779")
}


