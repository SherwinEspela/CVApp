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
        static let header1 = UIFont.boldSystemFont(ofSize: 24)
        static let header2 = UIFont.boldSystemFont(ofSize: 22)
        static let header3 = UIFont.boldSystemFont(ofSize: 20)
        static let header4 = UIFont.systemFont(ofSize: 18)
        static let paragraph = UIFont.boldSystemFont(ofSize: 16)
        static let title = UIFont.boldSystemFont(ofSize: 16)
        static let caption1 = UIFont.systemFont(ofSize: 14)
        static let caption2 = UIFont.systemFont(ofSize: 12)
    }
    
    struct Spacing {
        static let s4: CGFloat = 4
        static let s10: CGFloat = 10
        static let s20: CGFloat = 20
    }
}
