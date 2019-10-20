//
//  MainViewModel.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import Foundation

class MainViewModel {
    var cv: CV?
    
    func getCVHeaders(fromJsonData jsonData: Data?, with completionHandler: @escaping ([String]?, CVDataParserError?) -> Void) {
        CVDataParser.shared.parseCVData(fromJsonData: jsonData) { (cv, error) in
            if let error = error {
                completionHandler(nil, error)
            }

            self.cv = cv
            completionHandler(cv?.headers, nil)
        }
    }
}
