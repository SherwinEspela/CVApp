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
        ConstraintSetupHelper.setConstraint(forTopElement: nameLabel, withContainerView: self.contentView, topSpacing: StyleLibrary.Spacing.s10)
        let spacing = SpacingValues(sideSpacing: nil, topSpacing: StyleLibrary.Spacing.s4, bottomSpacing: nil)
        ConstraintSetupHelper.setConstraint(forElement: positionLabel, withOtherElement: nameLabel, spacingValues: spacing)
        ConstraintSetupHelper.setConstraint(forElement: companyLabel, withOtherElement: positionLabel, spacingValues: spacing)
        ConstraintSetupHelper.setConstraint(forElement: phoneLabel, withOtherElement: companyLabel, spacingValues: spacing)
        ConstraintSetupHelper.setConstraint(forElement: phoneLabel, withOtherElement: self.contentView, spacingValues: SpacingValues(sideSpacing: StyleLibrary.Spacing.s20, topSpacing: nil, bottomSpacing: StyleLibrary.Spacing.s10))
    }
}
