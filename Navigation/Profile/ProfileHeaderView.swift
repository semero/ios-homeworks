//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.masksToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.image = UIImage(named: "hipster_cat")
        
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 140, y: 27, width: 200, height: 18)
        label.font = UIFont.systemFont(ofSize: 18,weight: .bold)
        label.textColor = UIColor.black
        label.text = "Hipster Cat"
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 140, y: 91, width: 200, height: 14)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        label.text = "Waiting for something"
        
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 132, width: 300, height: 50)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.backgroundColor = .systemBlue
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray4
        
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func statusButtonPressed() {
        if let statusText = statusLabel.text {
            print(statusText)
        }
    }
}
