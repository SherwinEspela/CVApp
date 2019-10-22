//
//  MainViewModel.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

protocol MainViewModelDelegate: class {
    func mainViewModel(_ mainViewModel: MainViewModel, didFetchCV cv: CV)
}

import Foundation

class MainViewModel {
    var cv: CV?
    weak var delegate: MainViewModelDelegate? = nil
    
    func getCVData(withJsonDataFileName fileName: String, completionHandler: @escaping (CV?, CVDataParserError?) -> Void) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            completionHandler(nil, CVDataParserError.MissingJsonFile)
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url, options: .mappedIfSafe)
            CVDataParser.shared.parseCVData(fromJsonData: jsonData) { (cv, error) in
                if let error = error {
                    completionHandler(nil, error)
                    return
                }
                
                self.cv = cv
                completionHandler(cv, nil)
            }
        } catch {
            fatalError()
        }
    }
    
    func fetchCVData() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            self.getCVData(withJsonDataFileName: "cv_data", completionHandler: { (cv, error) in
                if let _ = error {
                    return
                }
                
                guard let cv = cv else { return }
                self.cv = cv
                self.delegate?.mainViewModel(self, didFetchCV: cv)
            })
        }
    }
}
