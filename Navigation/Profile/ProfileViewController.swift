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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        self.title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        self.view.addSubview(self.profileHeaderView)
        self.profileHeaderView.frame = CGRect(
            x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height)
    }
}
