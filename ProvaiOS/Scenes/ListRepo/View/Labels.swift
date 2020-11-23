//
//  Labels.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 23/11/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit

class TitleLabel : BaseLabel {
    override func setupFont() {
         font = UIFont(name: "HelveticaNeue-Bold", size: 18)
    }
}
class DescriptionLabel : BaseLabel {
    override func setupFont() {
         font = UIFont(name: "HelveticaNeue", size: 16)
    }
}
class BaseLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFont()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFont()
    }
    open func setupFont(){
        font = UIFont.boldSystemFont(ofSize: font.pointSize)
    }
}
