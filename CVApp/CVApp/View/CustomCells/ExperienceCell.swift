//
//  ExperienceCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-19.
//  Copyright © 2019 cybermash. All rights reserved.
//

import UIKit

class ExperienceCell: UITableViewCell {

    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let cellIdentifier = "experienceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupUIConstraints()
    }
    
    private func setupUI() {
        positionLabel.font = StyleLibrary.FontStyle.title
        companyNameLabel.font = StyleLibrary.FontStyle.caption1
        dateLabel.font = StyleLibrary.FontStyle.caption1
    }
    
    private func setupUIConstraints() {
        StyleLibrary.ConstraintSetup.setConstraint(forTitleLabel: positionLabel, fromContentView: self.contentView)
        StyleLibrary.ConstraintSetup.setConstraint(for: companyNameLabel, from: positionLabel)
        StyleLibrary.ConstraintSetup.setConstraint(for: dateLabel, from: companyNameLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forBottomLabel: dateLabel, fromContentView: self.contentView)
    }
}
