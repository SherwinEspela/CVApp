//
//  MainViewController.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17
//

import UIKit

struct MainViewControllerConstants {
    static let profileImageWidth: CGFloat = 130
    static let segueIdentifier = "segueToDetailsVC"
}

class MainViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var basicInfoView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var artBackgroundView: UIView!
    
    var mainVM: MainViewModel?
    
    var cvHeaders: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.nameLabel.text = self.mainVM?.cv?.basicInformation?.name
                self.addressLabel.text = self.mainVM?.cv?.basicInformation?.address
                self.phoneNumberLabel.text = self.mainVM?.cv?.basicInformation?.phone
                self.summaryLabel.text = self.mainVM?.cv?.basicInformation?.summary
                self.profileImageView.image = UIImage(named: "profilePicture")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setupUIConstraints()
        registerCell()
        
        mainVM = MainViewModel()
        mainVM?.delegate = self
        mainVM?.fetchCVData()
    }
    
    private func setupUI() {
        nameLabel.font = StyleLibrary.FontStyle.header1
        addressLabel.font = StyleLibrary.FontStyle.header4
        phoneNumberLabel.font = StyleLibrary.FontStyle.header4
        summaryLabel.font = StyleLibrary.FontStyle.paragraph
        
        nameLabel.textAlignment = .center
        summaryLabel.textAlignment = .justified
        
        addressLabel.numberOfLines = 0
        summaryLabel.numberOfLines = 0
        
        profileImageView.layer.cornerRadius = MainViewControllerConstants.profileImageWidth / 2
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        
        basicInfoView.backgroundColor = StyleLibrary.Color.mainBasicInfoBG
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [StyleLibrary.Color.lightBlue.cgColor, StyleLibrary.Color.darkBlue.cgColor]
        gradientLayer.frame = artBackgroundView.frame
        artBackgroundView.layer.insertSublayer(gradientLayer, at:0)
        
        tableView.separatorColor = .clear
    }
    
    private func setupUIConstraints() {
        self.view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        basicInfoView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            // for basicInfoView
            basicInfoView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            basicInfoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            basicInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            // for art bg
            artBackgroundView.widthAnchor.constraint(equalTo: basicInfoView.widthAnchor),
            artBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            artBackgroundView.topAnchor.constraint(equalTo: basicInfoView.topAnchor),
            
            // for profileImageView
            profileImageView.centerYAnchor.constraint(equalTo: artBackgroundView.bottomAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: MainViewControllerConstants.profileImageWidth),
            profileImageView.heightAnchor.constraint(equalToConstant: MainViewControllerConstants.profileImageWidth),
            profileImageView.centerXAnchor.constraint(equalTo: basicInfoView.centerXAnchor),
            
            // for Name
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: basicInfoView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: basicInfoView.trailingAnchor, constant: -20),
            
            // for summary
            summaryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            summaryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            // for address
            addressLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 10),
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            // for phone
            phoneNumberLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 2),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneNumberLabel.bottomAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: -10),
            
            // for tableView
            tableView.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 6),
            tableView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: HeaderCell.cellIdentifier)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.isSelected = false
        
        if let detailsVC = segue.destination as? DetailsViewController, let title = cvHeaders?[indexPath.row] {
            detailsVC.navigationItem.title = title
            detailsVC.detailsVM.cv = mainVM?.cv
        }
    }
}

// MARK: - UITableViewDelegate methods
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: MainViewControllerConstants.segueIdentifier, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - UITableViewDataSource methods
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cvHeaders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.cellIdentifier, for: indexPath) as? HeaderCell, let header = cvHeaders?[indexPath.row] else { fatalError() }
        cell.headerLabel.text = header
        return cell
    }
}

// MARK: - UITableViewDataSource methods
extension MainViewController: MainViewModelDelegate {
    
    func mainViewModel(_ mainViewModel: MainViewModel, didFetchCV cv: CV) {
        self.cvHeaders = cv.headers
    }
}
