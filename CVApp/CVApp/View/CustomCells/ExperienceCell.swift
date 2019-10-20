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
        StyleLibrary.ConstraintSetup.setConstraint(forTitleLabel: positionLabel, fromContentView: self.contentView)
        StyleLibrary.ConstraintSetup.setConstraint(forNextElement: companyNameLabel, from: positionLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forNextElement: dateLabel, from: companyNameLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forNextElement: responsibilityView, from: dateLabel)
        StyleLibrary.ConstraintSetup.setConstraint(forBottomElement: responsibilityView, fromContentView: self.contentView)
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
        StyleLibrary.ConstraintSetup.setConstraint(forTitleLabel: previousLabel, fromContentView: responsibilityView)
        StyleLibrary.ConstraintSetup.setConstraint(forLabel: previousLabel, fromContainer: responsibilityView, sideSpacing: .zero, topSpacing: .zero)
        
        labels.forEach {
            responsibilityView.addSubview($0)
            StyleLibrary.ConstraintSetup.setConstraint(forNextElement: $0, withWithElementOnTop: previousLabel)
            previousLabel = $0
        }
        
        if let lastLabel = labels.last {
            lastLabel.bottomAnchor.constraint(equalTo: responsibilityView.bottomAnchor).isActive = true
        }
        
        self.contentView.layoutIfNeeded()
    }
}
