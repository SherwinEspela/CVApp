//
//  ConstraintSetupHelper.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-19.
//

import Foundation
import UIKit

struct SpacingValues {
    let sideSpacing: CGFloat?
    let topSpacing: CGFloat?
    let bottomSpacing: CGFloat?
}

struct ConstraintSetupHelper {
    static func setConstraint<T>(forElement element: T, withOtherElement otherElement: T, spacingValues: SpacingValues) where T: UIView {
        element.translatesAutoresizingMaskIntoConstraints = false
        
        if let topSpacing = spacingValues.topSpacing {
            element.topAnchor.constraint(equalTo: otherElement.bottomAnchor, constant: topSpacing).isActive = true
        }
        
        if let sideSpacing = spacingValues.sideSpacing {
            NSLayoutConstraint.activate([
                element.leadingAnchor.constraint(equalTo: otherElement.leadingAnchor, constant: sideSpacing),
                element.trailingAnchor.constraint(equalTo: otherElement.trailingAnchor, constant: -sideSpacing)
            ])
        } else {
            NSLayoutConstraint.activate([
                element.leadingAnchor.constraint(equalTo: otherElement.leadingAnchor),
                element.trailingAnchor.constraint(equalTo: otherElement.trailingAnchor)
            ])
        }
        
        if let bottomSpacing = spacingValues.bottomSpacing {
            element.bottomAnchor.constraint(equalTo: otherElement.bottomAnchor, constant: -bottomSpacing).isActive = true
        }
    }
    
    static func setConstraint<T>(forTopElement element: T, withContainerView containerView: UIView, topSpacing: CGFloat) where T: UIView {
        element.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            element.topAnchor.constraint(equalTo: containerView.topAnchor, constant: topSpacing),
            element.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: StyleLibrary.Spacing.s20),
            element.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -StyleLibrary.Spacing.s20)
        ])
    }
}
