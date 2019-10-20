//
//  ReferenceCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-18.
//

import UIKit

class ReferenceCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    
    static let cellIdentifier = "referenceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupUIConstraints()
    }
    
    private func setupUI() {
        nameLabel.font = StyleLibrary.FontStyle.title
        positionLabel.font = StyleLibrary.FontStyle.caption1
        companyLabel.font = StyleLibrary.FontStyle.caption2
        phoneLabel.font = StyleLibrary.FontStyle.caption2
    }
    
    private func setupUIConstraints() {
        StyleLibrary.ConstraintSetup.setConstraint(forTitleLabel: nameLabel, fromContentView: self.contentView)
        StyleLibrary.ConstraintSetup.setConstraint(for: positionLabel, from: nameLabel)
        StyleLibrary.ConstraintSetup.setConstraint(for: companyLabel, from: positionLabel)
        StyleLibrary.ConstraintSetup.setConstraint(for: phoneLabel, from: companyLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forBottomLabel: phoneLabel, fromContentView: self.contentView)
    }
}
