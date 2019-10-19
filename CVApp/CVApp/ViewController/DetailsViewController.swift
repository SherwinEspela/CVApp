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
    
    var referenceCell: ReferenceCell? {
        return tableView.dequeueReusableCell(withIdentifier: "referenceCell") as? ReferenceCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
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
    
    private func registerCells() {
        tableView.register(UINib(nibName: "ReferenceCell", bundle: nil), forCellReuseIdentifier: "referenceCell")
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellHeight(with: self.navigationItem.title!)
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let title = self.navigationItem.title else { return 0 }
        return detailsVM.getNumberOfSection(with: title) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCellType(with: self.navigationItem.title!, at: indexPath)
        return cell
    }
    
    private func getCellType(with pageTitle: String, at indexPath: IndexPath) -> UITableViewCell {
        switch pageTitle {
        case CVHeaderType.experience.rawValue:
            return UITableViewCell()
        case CVHeaderType.education.rawValue:
            return UITableViewCell()
        case CVHeaderType.language.rawValue:
            guard let language = detailsVM.cv?.language?[indexPath.row] else { fatalError() }
            let cell = UITableViewCell()
            cell.textLabel?.text = language
            return cell
        case CVHeaderType.references.rawValue:
            guard let cell = referenceCell, let reference = detailsVM.cv?.references?[indexPath.row],
                let name = reference.name, let position = reference.position else {
                fatalError()
            }
            cell.nameAndPositionLabel.text = "\(name) ( \(position) )"
            cell.companyLabel.text = reference.company
            cell.phoneLabel.text = reference.phone
            return cell
        case CVHeaderType.skills.rawValue:
            guard let skill = detailsVM.cv?.skills?[indexPath.row] else { fatalError() }
            let cell = UITableViewCell()
            cell.textLabel?.text = skill
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    private func getCellHeight(with pageTitle: String) -> CGFloat {
        switch pageTitle {
        case CVHeaderType.experience.rawValue:
            return 50
        case CVHeaderType.education.rawValue:
            return 50
        case CVHeaderType.references.rawValue:
            guard let cell = referenceCell else {
                return 0
            }
            return cell.frame.height
        default:
            return 50
        }
    }
}
