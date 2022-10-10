//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Semyon on 02.08.2022.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    var buttonTapCallback: () -> () = {}
    
    // MARK: - Subviews
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postLikesLabel, postViewsLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var postLikesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var postViewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .right
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupView() {
        accessoryType = .none
    }
    
    private func setupSubviews() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    // MARK: - Public
    
    func update(_ model: Post) {
//        postImageView.image = UIImage(named: model.image)
        if let image = UIImage(named: model.image) {
            ImageProcessor().processImage(sourceImage: image, filter: .colorInvert) {
                postImageView.image = $0
            }
        }
        
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        postLikesLabel.text = "Likes: \(model.likes)"
        postViewsLabel.text = "Views: \(model.views)"
    }
    
    func setup(
            with post: Post
        ) {
            authorLabel.text = post.author
    //        postImage.image = UIImage(named: post.image)

            if let image = UIImage(named: post.image) {
                ImageProcessor().processImage(sourceImage: image, filter: .colorInvert) {
                    postImageView.image = $0
                }
            }

            descriptionLabel.text = post.description
            postViewsLabel.text = String("Likes: (post.views)")
            postLikesLabel.text = String("Views: (post.likes)")
        }
    
    // MARK: - Actions
    
    @objc private func didTapButton(_ sender: UIResponder) {
        buttonTapCallback()
    }
}
