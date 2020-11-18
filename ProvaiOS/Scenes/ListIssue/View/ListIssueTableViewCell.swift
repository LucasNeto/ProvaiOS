//
//  ListIssueTableViewCell.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit

class ListIssueTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(title: String?, state: String?) {
        self.titleLbl?.text = title
        self.stateLbl?.text = "Status: \(state ?? "Não indentificado")"
    }
}
