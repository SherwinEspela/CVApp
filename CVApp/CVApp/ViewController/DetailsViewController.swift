//
//  DetailsViewController.swift
//  CVApp
//
//  Created by Sherwin Espela on 2019-10-17.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let detailsVM = DetailsViewModel()
    var cvHeaderType: CVHeaderType = .education
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    private func setupConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let title = self.navigationItem.title else { return 0 }
        return detailsVM.getNumberOfSection(with: title) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCellType(with: self.navigationItem.title!)
        if let title = detailsVM.cv?.language?[indexPath.row] {
            cell.textLabel?.text = title
        }
        return cell
    }
    
    private func getCellType(with pageTitle: String) -> UITableViewCell {
        switch pageTitle {
        case CVHeaderType.experience.rawValue:
            return UITableViewCell()
        case CVHeaderType.education.rawValue:
            return UITableViewCell()
        case CVHeaderType.language.rawValue:
            return UITableViewCell()
        case CVHeaderType.references.rawValue:
            return UITableViewCell()
        case CVHeaderType.skills.rawValue:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}
