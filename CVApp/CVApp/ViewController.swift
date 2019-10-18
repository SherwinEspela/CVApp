//
//  ViewController.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.path(forResource: "cv_data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
    
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let cv = try JSONDecoder().decode(CV.self, from: data)
            
            if let exp = cv.experience {
                exp.forEach {
                    print($0.companyName!)
                    print($0.position!)
                }
            }
        
        } catch {
            //
        }
    }
}

