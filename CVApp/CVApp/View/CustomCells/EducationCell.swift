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
        ConstraintSetupHelper.setConstraint(forTopElement: degreeLabel, withContainerView: self.contentView, topSpacing: StyleLibrary.Spacing.s10)
        let spacing = SpacingValues(sideSpacing: nil, topSpacing: StyleLibrary.Spacing.s4, bottomSpacing: nil)
        ConstraintSetupHelper.setConstraint(forElement: schoolLabel, withOtherElement: degreeLabel, spacingValues: spacing)
        ConstraintSetupHelper.setConstraint(forElement: yearGraduatedLabel, withOtherElement: schoolLabel, spacingValues: spacing)
        ConstraintSetupHelper.setConstraint(forElement: yearGraduatedLabel, withOtherElement: self.contentView, spacingValues: SpacingValues(sideSpacing: StyleLibrary.Spacing.s20, topSpacing: nil, bottomSpacing: StyleLibrary.Spacing.s10))
    }
}
