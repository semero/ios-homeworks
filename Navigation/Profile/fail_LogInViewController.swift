//
//  LogInViewController.swift
//  Navigation
//
//  Created by Semyon on 22.07.2022.
//

import UIKit


class LogInViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var scrolView: UIScrollView = {
        let scrolView = UIScrollView()
        scrolView.translatesAutoresizingMaskIntoConstraints = false
//        scrolView.showsVerticalScrollIndicator = true
//        scrolView.showsHorizontalScrollIndicator = false
//        scrolView.backgroundColor = .red
        return scrolView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = .blue
        
        return contentView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        
        return image
    }()
    
    private lazy var loginDataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        
        setupTextField(textField)

        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        
        setupTextField(textField)

        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(named: "Brand_color")
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    // MARK: - Action
    
    @objc private func logInButtonPressed() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrolView.contentInset.bottom = keyboardHeight ?? 0.0
    }
    
    @objc private func willHideKeyboard(_ notification: NSNotification) {
        scrolView.contentInset.bottom = 0.0
    }
    
    // MARK: - Private
    
    private func setupView() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupSubview() {
        self.view.addSubview(self.scrolView)
        scrolView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(loginDataView)
        loginDataView.addSubview(emailTextField)
        loginDataView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrolView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrolView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrolView.widthAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            loginDataView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            loginDataView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginDataView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            loginDataView.heightAnchor.constraint(equalToConstant: 100),

            emailTextField.topAnchor.constraint(equalTo: loginDataView.topAnchor),
            emailTextField.widthAnchor.constraint(equalTo: loginDataView.widthAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.bottomAnchor.constraint(equalTo: loginDataView.bottomAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: loginDataView.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: loginDataView.bottomAnchor, constant: 16),
            logInButton.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor,constant: -16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupTextField(_ textField: UITextField) {
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.delegate = self
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
