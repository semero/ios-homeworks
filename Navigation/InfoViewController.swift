//
//  InfoViewController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class InfoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemYellow
        
        alertButton()
    }
    
    private func alertButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Alert", for: .normal)
        button.backgroundColor = .systemBlue
        button.center = view.center
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func showAlert() {
        let alertController = UIAlertController(
            title: "Some alert",
            message: "Some alert message",
            preferredStyle: .alert)
        
        let alertActionOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(alertActionOK)
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .default) { alert in
            print("Tap Cancel")
        }
        
        alertController.addAction(alertActionCancel)
        present(alertController, animated: true, completion: nil)
    }
}
