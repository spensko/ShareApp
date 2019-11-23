//
//  TableViewCell.swift
//  ShareApp
//
//  Created by Mikhail Serov on 23.11.2019.
//  Copyright © 2019 serov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private let thumbnail = UIImageView()
    private let name = UILabel()
    private let info = UILabel()
    private let url = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail.image = nil
    }
    
    private func buildUI() {
        
        selectionStyle = .none
        
        name.text = "Text"
        info.text = "info"
        url.text = "https://www.google.com"
        thumbnail.backgroundColor = .gray
        
        url.isEditable = false
        url.dataDetectorTypes = .link
        url.isScrollEnabled = false
        
        let hStack = UIStackView()
        hStack.axis = .vertical
        hStack.spacing = 4
        
        hStack.translatesAutoresizingMaskIntoConstraints = false
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hStack)
        addSubview(thumbnail)

        hStack.addArrangedSubview(name)
        hStack.addArrangedSubview(info)
        hStack.addArrangedSubview(url)
        
        NSLayoutConstraint.activate([
            thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            thumbnail.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbnail.widthAnchor.constraint(equalToConstant: 30),
            thumbnail.heightAnchor.constraint(equalToConstant: 30),
            
            hStack.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 16),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    func setup(with element: ShareObj) {
        if let imageData = element.thumbnail {
            thumbnail.image = UIImage(data: imageData)
        }
        name.text = element.name
        info.text = element.info
        url.text = element.url
        info.isHidden = element.info == nil
    }
}
