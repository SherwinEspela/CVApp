//
//  StyleLibrary.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-19.
//

import Foundation
import UIKit

struct StyleLibrary {
    
    struct FontStyle {
        static let title = UIFont.boldSystemFont(ofSize: 16)
        static let caption1 = UIFont.systemFont(ofSize: 14)
        static let caption2 = UIFont.systemFont(ofSize: 12)
    }
    
    struct Spacing {
        static let s4: CGFloat = 4
        static let s10: CGFloat = 10
        static let s20: CGFloat = 20
    }
    
    struct ConstraintSetup {
        static func setConstraint(forTitleLabel titleLabel: UILabel, fromContentView contentView: UIView) {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Spacing.s10),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.s20),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.s20),
            ])
        }
        
        static func setConstraint(for nextLabel: UILabel, from labelOnTop: UILabel) {
            nextLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nextLabel.topAnchor.constraint(equalTo: labelOnTop.bottomAnchor, constant: Spacing.s4),
                nextLabel.leadingAnchor.constraint(equalTo: labelOnTop.leadingAnchor),
                nextLabel.trailingAnchor.constraint(equalTo: labelOnTop.trailingAnchor),
            ])
        }
        
        static func setConstraint(forBottomLabel bottomLabel: UILabel, fromContentView contentView: UIView) {
            bottomLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.s10)
            ])
        }
    }
}
