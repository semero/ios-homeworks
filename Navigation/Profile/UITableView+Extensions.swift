//
//  UITableView+Extensions.swift
//  Navigation
//
//  Created by Semyon on 02.08.2022.
//

import UIKit

extension UITableView {
    
    // @link https://stackoverflow.com/a/28102175
    
    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor),
//            headerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
