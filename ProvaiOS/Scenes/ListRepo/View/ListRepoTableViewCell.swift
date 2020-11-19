//
//  ListRepoTableViewCell.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit

class ListRepoTableViewCell: UITableViewCell {
    static var nibName = "ListRepoTableViewCell"

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var authorImg: UIImageView!
    @IBOutlet weak var starCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setup(_ viewModel: ListRepoModel.RepoResumed) {
        self.titleLbl?.text = viewModel.name
        self.authorLbl?.text = "Author: \(viewModel.authorName)"
        self.starCountLbl?.text = "\(viewModel.starsCount)"
        authorImg?.loadImageFrom(url: viewModel.imageUrl)
    }
}
