//
//  ViewController.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-16.
//  Copyright © 2019 cybermash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let path = Bundle.main.path(forResource: "cv_data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
    
        do {
            let data = try Data(contentsOf: url)
            //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let references = try JSONDecoder().decode([Reference].self, from: data)
            print(references)
            
        } catch {
            //
        }
    }


}

