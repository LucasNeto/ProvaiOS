//
//  ListRepoPresenter.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//
import UIKit

protocol ListRepoPresenterProtocol {
    func presentListRepo(list: [RepoItem])
    func presentError(error: String)
    func showLoading()
    func hideLoading()
}

class ListRepoPresenter : ListRepoPresenterProtocol {
    var viewController: ListRepoTableViewControllerProtocol?
    init(_ viewController: ListRepoTableViewControllerProtocol?){
        self.viewController = viewController
    }
    func presentListRepo(list: [RepoItem]) {
        let listResumed = self.getListResumed(list)
        let viewModel = ListRepoModel.ViewModel(list: listResumed)
        self.viewController?.displayRepos(viewModel)
    }
    func presentError(error: String) {
        self.viewController?.displayError(error)
    }
    
    private func getListResumed(_ list: [RepoItem]) -> [ListRepoModel.RepoResumed] {
        return list.map { (repo) -> ListRepoModel.RepoResumed in
            let name = repo.name ?? ""
            let stars = repo.stargazersCount ?? 0
            let img = repo.owner?.avatarURL ?? ""
            let authorName = repo.owner?.login ?? ""
            return ListRepoModel.RepoResumed(name: name,
                                             starsCount: stars,
                                             imageUrl: img,
                                             authorName: authorName)
        }
    }
    func showLoading(){
        self.viewController?.showLoading()
    }
    
    func hideLoading(){
        self.viewController?.hideLoading()
    }
}
