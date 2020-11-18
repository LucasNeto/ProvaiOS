//
//  DetailIssueViewController.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit
protocol DetailIssueViewControllerProtocol {
    func displayIssue(viewModel: DetailIssueModel.ViewModel)
}
class DetailIssueViewController: UIViewController, DetailIssueViewControllerProtocol {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    
    var issue: Issue?
    var presenter: DetailIssuePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.presenter?.setIssue(issue)
    }
    // MARK: - Setups
    private func setup(){
        self.presenter = DetailIssuePresenter(self)
    }
    
    func displayIssue(viewModel: DetailIssueModel.ViewModel){
        self.titleLbl?.text = viewModel.title
        self.bodyLbl?.text = viewModel.description
        self.dateLbl?.text = viewModel.dataCreated
        self.imageView?.loadImageFrom(url: viewModel.imageUrl)
    }
    
    @IBAction func goToIssueTapped(_ sender: UIButton) {
        self.presenter?.openSiteIssue()
    }

}
