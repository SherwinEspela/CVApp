//
//  DetailsViewModel.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-18.
//  Copyright © 2019 cybermash. All rights reserved.
//

import Foundation

enum CVHeaderType: String {
    case experience = "Experience"
    case education = "Education"
    case language = "Language"
    case references = "References"
    case skills = "Skills"
}

class DetailsViewModel {
    var cv: CV?
    
    func getNumberOfSection(with pageTitle: String) -> Int? {
        switch title {
        case CVHeaderType.experience.rawValue:
            return cv?.experience?.count
        case CVHeaderType.education.rawValue:
            return cv?.education?.count
        case CVHeaderType.language.rawValue:
            return cv?.language?.count
        case CVHeaderType.references.rawValue:
            return cv?.references?.count
        case CVHeaderType.skills.rawValue:
            return cv?.skills?.count
        default:
            return nil
        }
    }
}
