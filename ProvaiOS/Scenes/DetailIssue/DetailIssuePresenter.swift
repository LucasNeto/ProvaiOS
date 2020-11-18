//
//  DetailIssuePresenter.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import Foundation
import UIKit

protocol DetailIssuePresenterProtocol {
    func setIssue(_ issue:Issue?)
    func openSiteIssue()
}
class DetailIssuePresenter : DetailIssuePresenterProtocol {
    var viewController: DetailIssueViewControllerProtocol?
    var issueSelected: Issue?
    init(_ viewController: DetailIssueViewControllerProtocol?) {
        self.viewController = viewController
    }
    
    func setIssue(_ issue:Issue?) {
        self.issueSelected = issue
        let title = issue?.title ?? "Sem titulo"
        let description = issue?.body ?? "Sem descrição"
        let imageUrl = issue?.user?.avatarURL
        let dataCreated = self.getDataFormatted(issue?.createdAt)
        let viewModel = DetailIssueModel.ViewModel(title: title, description: description, imageUrl: imageUrl, dataCreated: dataCreated)
        self.viewController?.displayIssue(viewModel: viewModel)
    }
    func openSiteIssue() {
        if let urlIssue = self.issueSelected?.htmlURL,
            let url = URL(string: urlIssue),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    private func getDataFormatted(_ date: String?) -> String {
        return date?.date(format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")?.string(format: "dd, MMMM 'de' yyyy 'as' HH'h'mm") ?? "Sem data"
    }
    
}
