//
//  CVDataParser.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import Foundation

enum CVDataParserError: Error {
    case MissingJsonFile
    case MissingJsonData
    case ParsingFailed
}

struct CVDataParser {
    static let shared = CVDataParser()
    private init() {}
    
    func parseCVData(fromJsonData data: Data?, with completionHandler: @escaping (CV?, CVDataParserError?) -> Void) {
        
        guard let data = data else {
            completionHandler(nil, CVDataParserError.MissingJsonData)
            return
        }
        
        do {
            let cv = try JSONDecoder().decode(CV.self, from: data)
            completionHandler(cv, nil)
        } catch {
            completionHandler(nil, CVDataParserError.ParsingFailed)
        }
    }
}
