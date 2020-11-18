//
//  ListIssuePresenter.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import UIKit

protocol ListIssuePresenterProtocol {
    func getListIssue()
    func select(index:Int)
}

class ListIssuePresenter : ListIssuePresenterProtocol {
    var viewController: ListIssueTableViewControllerProtocol?
    var repository: ListIssueRepositoryProtocol?
    var listIssues: [Issue]?
    init(_ viewController: ListIssueTableViewControllerProtocol?, repository: ListIssueRepositoryProtocol?){
        self.viewController = viewController
        self.repository = repository
    }
    func getListIssue(){
        self.repository?.getIssues(completion: { (result) in
            switch result{
            case .success(let list):
                self.listIssues = list
                let listResumed = self.getListResumed(list)
                self.viewController?.displayIssues(ListIssueModel.ViewModel(list: listResumed))
                break
            case .failure(let error):
                self.viewController?.displayError(error.getMessage())
                break
            }
        })
    }
    func select(index:Int) {
        guard let list = self.listIssues else { return }
        if list.count > index {
            self.viewController?.goToDetail(list[index])
        }
    }
    
    private func getListResumed(_ list: [Issue]) -> [ListIssueModel.IssueResumed] {
        return list.map { (issue) -> ListIssueModel.IssueResumed in
            let title = issue.title ?? ""
            let state: ListIssueModel.IssueState = issue.state == "open" ? .open : .closed
            return ListIssueModel.IssueResumed(title: title, state: state)
        }
    }
}
