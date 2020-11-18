//
//  ListIssueTableViewController.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit
protocol ListIssueTableViewControllerProtocol {
    func displayIssues(_ viewModel: ListIssueModel.ViewModel)
    func displayError(_ message: String)
    func goToDetail(_ issue: Issue)
}
class ListIssueTableViewController: UITableViewController, ListIssueTableViewControllerProtocol {

    private let reusableID = "listIssueReusableID"
    var presenter: ListIssuePresenterProtocol?
    var itens: [ListIssueModel.IssueResumed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
        self.presenter?.getListIssue()
    }
    
    // MARK: - Setups
    private func setup(){
        
        self.presenter = ListIssuePresenter(self, repository: ListIssueRepository())
    }
    private func setupTableView(){
        self.tableView.register(UINib(nibName: "ListIssueTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: reusableID)
    }
    
    // MARK: - ListIssueTableViewControllerProtocol
    func displayIssues(_ viewModel: ListIssueModel.ViewModel){
        self.itens = viewModel.list
        self.tableView.reloadData()
    }
    func displayError(_ message: String){
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in
            self.presenter?.getListIssue()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
    func goToDetail(_ issue: Issue) {
        let viewController = DetailIssueViewController()
        viewController.issue = issue
        self.show(viewController, sender: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableID, for: indexPath) as? ListIssueTableViewCell else {
            return UITableViewCell()
        }
        let item = self.itens[indexPath.row]
        let state = item.state == .open ? "Aberto" : "Fechado"
        cell.setup(title: item.title, state: state)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.select(index: indexPath.row)
    }
}
