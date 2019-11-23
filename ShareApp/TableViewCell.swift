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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        buildUI()
    }

    private func buildUI() {
        
        name.text = "Text"
        info.text = "info"
        url.text = "https://www.google.com"
        
        url.isEditable = false
        url.dataDetectorTypes = .link
        
        let hStack = UIStackView()
        hStack.axis = .vertical
        hStack.spacing = 4
        
        contentView.addSubview(hStack)
        contentView.addSubview(thumbnail)
        thumbnail.leading(16).centerY().width(30).height(30)
        
        hStack.leading(16, to: thumbnail).trailing(16).top(10).bottom(10)
        hStack.addArrangedSubview(name)
        hStack.addArrangedSubview(info)
        hStack.addArrangedSubview(url)
    }
}
