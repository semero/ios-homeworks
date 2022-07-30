//
//  LoginViewController.swift
//  Navigation
//
//  Created by Semyon on 29.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        
        return stackView
    }()
    
    private lazy var textField_1: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        
        setupTextField(textField)
        
        return textField
    }()
    
    private lazy var textField_2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        
        setupTextField(textField)
        
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Brand_color")
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        self.setupGestures()
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.stackView)
        self.contentView.addSubview(self.button)
        
        self.stackView.addArrangedSubview(self.textField_1)
        self.stackView.addArrangedSubview(self.textField_2)
        
        let scrollViewConstraints = self.scrollViewConstraints()
        let contentViewConstraints = self.contentViewConstraints()
        let logoImageViewConstraints = self.logoImageViewConstraints()
        let stackViewConstraints = self.stackViewConstraints()
        let buttonConstraints = self.buttonConstraints()
        
        NSLayoutConstraint.activate(
            scrollViewConstraints +
            contentViewConstraints +
            logoImageViewConstraints +
            stackViewConstraints +
            buttonConstraints
        )
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func scrollViewConstraints() -> [NSLayoutConstraint] {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        let topAnchor = self.scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor)
        let leadingAnchor = self.scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor)
        let trailingAnchor = self.scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        
        return [
            topAnchor, leadingAnchor, trailingAnchor, bottomAnchor
        ]
    }
    
    private func contentViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let leadingAnchor = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let widthAnchor = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let bottomAnchor = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        
        return [
            topAnchor, leadingAnchor, widthAnchor, bottomAnchor
        ]
    }
    
    private func logoImageViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let centerXAnchor = self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let widthAnchor = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        let heightAnchor = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)
        
        return [
            topAnchor, centerXAnchor, widthAnchor, heightAnchor
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.stackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120)
        let centerXAnchor = self.stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let widthAnchor = self.stackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -32)
        let heightAnchor = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        
        return [
            topAnchor, centerXAnchor, widthAnchor, heightAnchor
        ]
    }
    
    private func buttonConstraints() -> [NSLayoutConstraint] {
        let topAnchor = self.button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        let centerXAnchor = self.button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let widthAnchor = self.button.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32)
        let heightAnchor = self.button.heightAnchor.constraint(equalToConstant: 50)
        
        let bottomAnchor = self.button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -16)
        
        return [
            topAnchor, centerXAnchor, widthAnchor, heightAnchor, bottomAnchor
        ]
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = self.scrollView.frame.origin.y + self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @objc private func buttonPressed() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}
