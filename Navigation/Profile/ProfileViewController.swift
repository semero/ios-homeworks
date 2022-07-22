//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.title = "Profile"
    }
    
    private func setupSubview() {
        self.view.addSubview(self.profileHeaderView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 202)
        ])
    }
}
