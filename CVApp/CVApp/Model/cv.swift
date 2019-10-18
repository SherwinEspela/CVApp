//
//  cv.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import Foundation

struct CV: Decodable {
    struct basicInformation: Decodable {
        let name: String?
        let address: String?
        let phone: String?
        let summary: String?
    }
    
    let experience: [Experience]?
    let education: [Education]?
    let skills: [String]?
    let language: [String]?
    let references: [Reference]?
}
