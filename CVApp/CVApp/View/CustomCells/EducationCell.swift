//
//  EducationCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-19.
//

import UIKit

class EducationCell: UITableViewCell {

    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var degreeLabel: UILabel!
    @IBOutlet var yearGraduatedLabel: UILabel!
    
    static let cellIdentifier = "educationCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupUIConstraints()
    }
    
    private func setupUI()
    {
        degreeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        schoolLabel.font = UIFont.systemFont(ofSize: 16)
        yearGraduatedLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    private func setupUIConstraints() {
        StyleLibrary.ConstraintSetup.setConstraint(forTitleLabel: degreeLabel, fromContentView: self.contentView)
        StyleLibrary.ConstraintSetup.setConstraint(for: schoolLabel, from: degreeLabel)
        StyleLibrary.ConstraintSetup.setConstraint(for: yearGraduatedLabel, from: schoolLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forBottomLabel: yearGraduatedLabel, fromContentView: self.contentView)
    }
}
