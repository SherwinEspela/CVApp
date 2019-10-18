//
//  CVDataParser.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//  Copyright © 2019 cybermash. All rights reserved.
//

import Foundation

enum CVDataParserError: Error {
    case MissingJsonFile
    case ParsingFailed
}

struct CVDataParser {
    static let shared = CVDataParser()
    private init() {}
    
    func parseCVData(with completionHandler: @escaping (CV?, CVDataParserError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "cv_data", ofType: "json") else {
            completionHandler(nil, CVDataParserError.MissingJsonFile)
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let cv = try JSONDecoder().decode(CV.self, from: data)
            completionHandler(cv, nil)
        } catch {
            completionHandler(nil, CVDataParserError.ParsingFailed)
        }
    }
}
