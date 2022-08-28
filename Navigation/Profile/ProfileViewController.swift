//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Data
    
    fileprivate let data = Post.make()
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private enum CellReuseID: String {
        case custom_0 = "CustomTableViewCell_ReuseID_0"
        case custom_1 = "CustomTableViewCell_ReuseID_1"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        
        setupConstraints()
        setupTableView()
    }
    
    // MARK: - Private
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    private func setupTableView() {
        tableView.sectionFooterHeight = 0
        
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.custom_0.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.custom_1.rawValue)
        tableView.register(ProfileTableHederView.self, forHeaderFooterViewReuseIdentifier: "headerInSection")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseID.custom_0.rawValue,
                for: indexPath
            ) as? PhotosTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseID.custom_1.rawValue,
                for: indexPath
            ) as? PostTableViewCell else {
                fatalError("could not dequeueReusableCell")
            }
            
            cell.update(data[indexPath.row])
            
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerInSection")
        return section == 0 ? header : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 202 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photoGallery = PhotosViewController()
            photoGallery.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(photoGallery, animated: true)
        }
    }
}
