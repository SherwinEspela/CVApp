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
    
    var mainVM: MainViewModel?
    
    var cvHeaders: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.cvSummarytableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCVData()
    }
    
    private func setupUI() {
        cvSummarytableView.delegate = self
        cvSummarytableView.dataSource = self
        setupConstraints()
    }
    
    private func fetchCVData() {
        mainVM = MainViewModel()
        mainVM?.getCVHeaders(with: { (cvHeaders, error) in
            if let _ = error { return }
            self.cvHeaders = cvHeaders
        })
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
        return cvHeaders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let header = cvHeaders?[indexPath.row] {
            cell.textLabel?.text = header
        }
        
        return cell
    }
}
