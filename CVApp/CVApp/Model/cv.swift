//
//  cv.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import Foundation

struct CV: Decodable {
    let basicInformation: BasicInformation?
    let experience: [Experience]?
    let education: [Education]?
    let skills: [String]?
    let language: [String]?
    let references: [Reference]?
    let headers: [String]?
}

struct BasicInformation: Decodable {
    let name: String?
    let address: String?
    let phone: String?
    let summary: String?
}
