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
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        schoolLabel.translatesAutoresizingMaskIntoConstraints = false
        yearGraduatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            degreeLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            degreeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            degreeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            schoolLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 4),
            schoolLabel.leadingAnchor.constraint(equalTo: degreeLabel.leadingAnchor),
            schoolLabel.trailingAnchor.constraint(equalTo: degreeLabel.trailingAnchor),
            
            yearGraduatedLabel.topAnchor.constraint(equalTo: schoolLabel.bottomAnchor, constant: 4),
            yearGraduatedLabel.leadingAnchor.constraint(equalTo: degreeLabel.leadingAnchor),
            yearGraduatedLabel.trailingAnchor.constraint(equalTo: degreeLabel.trailingAnchor),
        ])
    }
}
