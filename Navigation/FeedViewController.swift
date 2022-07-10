//
//  FeedViewController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        self.view.backgroundColor = .white
        
        setupPostButton()
    }
    
    private func setupPostButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.center = view.center
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func showPost() {
        let vc = PostViewController()
        vc.title = Post(title: "Some post").title
        navigationController?.pushViewController(vc, animated: true)
    }
}
