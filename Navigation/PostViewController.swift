//
//  PostViewController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGreen
        
        setupItems()
    }
    
    private func setupItems() {
        let infoBarButton = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: .done,
            target: self,
            action: #selector(showInfo)
        )
        
        navigationItem.rightBarButtonItem = infoBarButton
    }
    
    @objc private func showInfo() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true, completion: nil)
    }
}
