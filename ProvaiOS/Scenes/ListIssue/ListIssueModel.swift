//
//  ListIssueModel.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

enum ListIssueModel {
    
    struct ViewModel {
        var list: [IssueResumed]
    }
    struct IssueResumed {
        var title: String
        var state: IssueState
    }
    enum IssueState: String{
        case open
        case closed
        case other
    }
}
