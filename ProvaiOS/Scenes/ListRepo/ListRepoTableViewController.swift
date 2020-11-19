//
//  ListRepoTableViewController.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit
protocol ListRepoTableViewControllerProtocol {
    func displayRepos(_ viewModel: ListRepoModel.ViewModel)
    func displayError(_ message: String)
}
class ListRepoTableViewController: UITableViewController, ListRepoTableViewControllerProtocol {

    private let reusableID = "listRepoReusableID"
    var interactor: ListRepoInteractorProtocol?
    var itens: [ListRepoModel.RepoResumed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        self.tableView.refreshControl?.beginRefreshing()
        self.interactor?.getRepos()
    }
    
    // MARK: - Setups
    private func setup(){
        let viewController = self
        let presenter = ListRepoPresenter(viewController)
        self.interactor = ListRepoInteractor(repository: ListRepoRepository(), presenter: presenter)
        
    }
    private func setupTableView(){
        self.tableView.register(UINib(nibName: ListRepoTableViewCell.nibName, bundle: .main), forCellReuseIdentifier: reusableID)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    
    // MARK: - ListRepoTableViewControllerProtocol
    func displayRepos(_ viewModel: ListRepoModel.ViewModel) {
        self.itens = viewModel.list
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    func displayError(_ message: String){
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in
            self.interactor?.getRepos()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableID, for: indexPath) as? ListRepoTableViewCell else {
            return UITableViewCell()
        }
        let item = self.itens[indexPath.row]
        cell.setup(item)
        return cell
    }
    @objc func refresh(sender:AnyObject) {
        self.interactor?.getRepos()
    }
}
