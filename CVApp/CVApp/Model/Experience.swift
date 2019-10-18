//
//  Experience.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//  Copyright © 2019 cybermash. All rights reserved.
//

import Foundation

struct Experience: Decodable {
    let position: String?
    let companyName: String?
    let location: String?
    let startDate: String?
    let endDate: String?
    let responsibilities: [String]?
}
