//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    private var statusText = String()           // Переменная для хранения введённого статуса
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "hipster_cat")
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Waiting for something"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.placeholder = "Enter status"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.addTarget(self, action:  #selector(statusTextChanged), for: UIControl.Event.editingChanged)
        
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Set status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.backgroundColor = .systemBlue
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.cornerRadius = 4
        
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray4
        
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {    // Обработчик изменений текстового поля statusTextField
        if let text = textField.text {
            statusText = text
        }
    }
    
    @objc private func statusButtonPressed() {
        statusLabel.text = statusText
        statusTextField.text = nil
        self.endEditing(true)                                           // Скрытие клавиатуры
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            fullNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16),
            
            statusLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140),
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            
            statusTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140),
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            setStatusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 136),
            setStatusButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
