//
//  HeaderCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-21.
//  Copyright © 2019 cybermash. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet var roundedBGView: UIView!
    @IBOutlet var headerLabel: UILabel!

    static let cellIdentifier = "headerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupUIConstraints()
    }

    private func setupUI() {
        headerLabel.font = StyleLibrary.FontStyle.header1
        headerLabel.textAlignment = .center
        headerLabel.textColor = UIColor.white
        roundedBGView.layer.cornerRadius = 14
        roundedBGView.backgroundColor = StyleLibrary.Color.headerCell
    }
    
    private func setupUIConstraints()
    {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        roundedBGView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            roundedBGView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            roundedBGView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
            roundedBGView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            roundedBGView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            headerLabel.centerXAnchor.constraint(equalTo: roundedBGView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: roundedBGView.centerYAnchor)
        ])
    }
}
