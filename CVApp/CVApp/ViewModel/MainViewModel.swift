//
//  MainViewModel.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import Foundation

class MainViewModel {
    var cv: CV?

    func getCVData(fromJsonData jsonData: Data?, with completionHandler: @escaping (CV?, CVDataParserError?) -> Void) {
        CVDataParser.shared.parseCVData(fromJsonData: jsonData) { (cv, error) in
            if let error = error {
                completionHandler(nil, error)
                return
            }

            self.cv = cv
            completionHandler(cv, nil)
        }
    }
    
    func getCVHeaders(completionHandler: @escaping ([String]?, CVDataParserError?) -> Void) {
        guard let path = Bundle.main.path(forResource: "cv_data", ofType: "json") else {
            completionHandler(nil, CVDataParserError.MissingJsonFile)
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            self.getCVData(fromJsonData: data, with: { (cv, error) in
                if let error = error {
                    completionHandler(nil, error)
                    return
                }
                completionHandler(cv?.headers, nil)
            })
        } catch {
            fatalError()
        }
    }
}
