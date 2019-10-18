//
//  MainViewController.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//  Copyright © 2019 cybermash. All rights reserved.
//

import UIKit

struct MainViewControllerConstants {
    static let basicInfoViewHeight: CGFloat = 160
    static let segueIdentifier = "segueToDetailsVC"
}

class MainViewController: UIViewController {

    @IBOutlet var cvSummarytableView: UITableView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var basicInfoView: UIView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelAddress: UILabel!
    @IBOutlet var labelPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        cvSummarytableView.delegate = self
        cvSummarytableView.dataSource = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        basicInfoView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // for basicInfoView
            basicInfoView.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            basicInfoView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            basicInfoView.heightAnchor.constraint(equalToConstant: MainViewControllerConstants.basicInfoViewHeight),
            basicInfoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            basicInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            // for profileImageView
            profileImageView.widthAnchor.constraint(equalToConstant: 110),
            profileImageView.heightAnchor.constraint(equalToConstant: 110),
            profileImageView.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 20),
            profileImageView.centerYAnchor.constraint(equalTo: basicInfoView.centerYAnchor),
            
            // for labelName
            labelName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            labelName.topAnchor.constraint(equalTo: basicInfoView.topAnchor, constant: 20),
            labelName.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -20),
            labelName.heightAnchor.constraint(equalToConstant: 40),
            
            // for labelAddress
            labelAddress.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelAddress.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            labelAddress.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 20),
            
            // for labelPhoneNumber
            labelPhoneNumber.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelPhoneNumber.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            labelPhoneNumber.bottomAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 10),
            
            // for cvSummaryTableView
            cvSummarytableView.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor),
            cvSummarytableView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            cvSummarytableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func parseJson() {
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
            fatalError("failed to parse json data")
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: MainViewControllerConstants.segueIdentifier, sender: nil)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "TEST"
        return cell
    }
}
