//
//  ExperienceCell.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-19.
//

import UIKit

class ExperienceCell: UITableViewCell {

    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var responsibilityView: UIView!
    
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
        ConstraintSetupHelper.setConstraint(forTopElement: positionLabel, withContainerView: self.contentView, topSpacing: StyleLibrary.Spacing.s10)
        let spacingValues = SpacingValues(sideSpacing: nil, topSpacing: StyleLibrary.Spacing.s4, bottomSpacing: nil)
        ConstraintSetupHelper.setConstraint(forElement: companyNameLabel, withOtherElement: positionLabel, spacingValues: spacingValues)
        ConstraintSetupHelper.setConstraint(forElement: dateLabel, withOtherElement: companyNameLabel, spacingValues: spacingValues)
        ConstraintSetupHelper.setConstraint(forElement: responsibilityView, withOtherElement: self.contentView, spacingValues: SpacingValues(sideSpacing: 0, topSpacing: nil, bottomSpacing: StyleLibrary.Spacing.s20))
        responsibilityView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: StyleLibrary.Spacing.s4).isActive = true
    }
    
    func add(responsibilities: [String]){
        let labels = responsibilities.map { (responsibility) -> UILabel in
            let label = UILabel()
            label.font = StyleLibrary.FontStyle.caption2
            label.numberOfLines = 0
            label.text = responsibility
            return label
        }

        var previousLabel = UILabel()
        previousLabel.text = "Responsibilities:"
        previousLabel.font = StyleLibrary.FontStyle.caption1
        responsibilityView.addSubview(previousLabel)
        ConstraintSetupHelper.setConstraint(forTopElement: previousLabel, withContainerView: responsibilityView, topSpacing: StyleLibrary.Spacing.s10)
        
        labels.forEach {
            responsibilityView.addSubview($0)
            ConstraintSetupHelper.setConstraint(forElement: $0, withOtherElement: previousLabel, spacingValues: SpacingValues(sideSpacing: 0, topSpacing: StyleLibrary.Spacing.s4, bottomSpacing: nil))
            previousLabel = $0
        }

        if let lastLabel = labels.last {
            lastLabel.bottomAnchor.constraint(equalTo: responsibilityView.bottomAnchor).isActive = true
        }
    }
}
