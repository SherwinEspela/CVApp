//
//  ReferenceCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-18.
//

import UIKit

class ReferenceCell: UITableViewCell {

    @IBOutlet var nameAndPositionLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupUIConstraints()
    }
    
    private func setupUI() {
        nameAndPositionLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        companyLabel.font = UIFont.systemFont(ofSize: 12)
        phoneLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func setupUIConstraints() {
        nameAndPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameAndPositionLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameAndPositionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            nameAndPositionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            companyLabel.topAnchor.constraint(equalTo: nameAndPositionLabel.bottomAnchor, constant: 6),
            companyLabel.leadingAnchor.constraint(equalTo: nameAndPositionLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: nameAndPositionLabel.trailingAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 3),
            phoneLabel.leadingAnchor.constraint(equalTo: nameAndPositionLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameAndPositionLabel.trailingAnchor)
        ])
    }
}
