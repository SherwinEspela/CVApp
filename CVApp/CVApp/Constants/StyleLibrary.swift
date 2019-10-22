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
        static let paragraph = UIFont.systemFont(ofSize: 14)
        static let title = UIFont.boldSystemFont(ofSize: 16)
        static let caption1 = UIFont.systemFont(ofSize: 14)
        static let caption2 = UIFont.systemFont(ofSize: 12)
        static let headerCell = UIFont.boldSystemFont(ofSize: 26)
    }
    
    struct Spacing {
        static let s4: CGFloat = 4
        static let s10: CGFloat = 10
        static let s20: CGFloat = 20
    }
    
    struct Color {
        static let mainBasicInfoBG = UIColor(red: 234/255, green: 235/255, blue: 235/235, alpha: 1.0)
        static let lightBlue =  UIColor(red: 18.0/255.0, green: 137.0/255.0, blue: 1.0, alpha: 1.0)
        static let darkBlue = UIColor(red: 45.0/255.0, green: 68.0/255.0, blue: 1.0, alpha: 1.0)
        static let headerCell = UIColor(red: 160/255, green: 160/255, blue: 160/235, alpha: 1.0)
    }
}
