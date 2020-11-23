//
//  ListRepoTableViewCell.swift
//  ProvaiOS
//
//  Created by Lucas  N Santana on 09/06/20.
//  Copyright © 2020 Lucas  N Santana. All rights reserved.
//

import UIKit

class ListRepoTableViewCell: UITableViewCell {
    //MARK: - Variables Data
    var title: String = "" {
        didSet {
            titleLbl.text = title
        }
    }
    var author: String = "" {
        didSet {
            authorLbl.text = "Author: \(author)"
        }
    }
    var starsText: String = ""{
        didSet {
            starsLbl.text = starsText
        }
    }
    var authorUrl: String? {
        didSet {
            authorImage.loadImageFrom(url: authorUrl)
        }
    }
    
    
    //MARK: - Variables Views
    private let authorImage : UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "person.fill"))
        imgView.tintColor = .darkGray
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let infoView: UIView = {
        return UIView()
    }()
    private let titleLbl: TitleLabel = {
        let label = TitleLabel()
        label.text = "Titulo do repositorio"
        return label
    }()
    private let authorLbl: DescriptionLabel = {
        let label = DescriptionLabel()
        label.text = "Auhtor: -"
        label.textColor = .gray
        return label
    }()
    private let starImg: UIImageView = {
        let imgView = UIImageView(image: UIImage(systemName: "star.fill"))
        imgView.tintColor = .systemYellow
        return imgView
    }()
    private let starsLbl: DescriptionLabel = {
        let label = DescriptionLabel()
        label.text = "5"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    private func setupViews(){
        addSubViews()
        setupConstraints()
        
    }
    private func addSubViews(){
        infoView.addSubview(titleLbl)
        infoView.addSubview(authorLbl)
        infoView.addSubview(starImg)
        infoView.addSubview(starsLbl)
        addStackView()
    }
    private func addStackView() {
        let stackH = UIStackView(arrangedSubviews: [authorImage,infoView])
        stackH.distribution = .fillProportionally
        stackH.axis = .horizontal
        stackH.spacing = 5
        addSubview(stackH)
        stackH.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16, width: 0, height: 0, enableInsets: false)
        
    }
    private func setupConstraints(){
        authorImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 96, height: 96, enableInsets: false)
        titleLbl.anchor(top: infoView.topAnchor, left: infoView.leftAnchor, bottom: nil, right: infoView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0, enableInsets: false)
        authorLbl.anchor(top: titleLbl.bottomAnchor, left: titleLbl.leftAnchor, bottom: nil, right: titleLbl.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        starImg.anchor(top: authorLbl.bottomAnchor, left: authorLbl.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 24, height: 24, enableInsets: false)
        starsLbl.anchor(top: starImg.topAnchor, left: starImg.rightAnchor, bottom: starImg.bottomAnchor, right: infoView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, enableInsets: false)
    }
}
