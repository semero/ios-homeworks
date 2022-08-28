//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Semyon on 14.08.2022.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: LayoutConstant.itemSize +
//                                                   LayoutConstant.itemInset * 2)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = .systemMint
        
        return cell
    }
}

//class PhotosViewController: UIViewController {
////    static let identifier = "photoGallery"
//
//    fileprivate lazy var photos: [Photo] = Photo.make()
//
//    fileprivate enum LayoutConstant {
//        static let itemSpacing: CGFloat = 8.0
//        static let itemSize: CGFloat = (UIScreen.main.bounds.width -
//                                        LayoutConstant.itemSpacing * 4) / 4
//    }
//    private let someLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Some label"
////        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let collectionView: UICollectionView = {
//        let viewLayout = UICollectionViewFlowLayout()
//        viewLayout.sectionInset = UIEdgeInsets(top: LayoutConstant.itemSpacing,
//                                               left: LayoutConstant.itemSpacing,
//                                               bottom: LayoutConstant.itemSpacing,
//                                               right: LayoutConstant.itemSpacing
//        )
//
//        viewLayout.itemSize = CGSize(width: LayoutConstant.itemSize,
//                                     height: LayoutConstant.itemSize
//        )
//
//        viewLayout.minimumInteritemSpacing = 8
////        viewLayout.minimumLineSpacing = 0
//
//        let collectionView = UICollectionView(frame: .zero,
//                                              collectionViewLayout: viewLayout
//        )
//
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(collectionView)
//        view.addSubview(someLabel)
//        view.backgroundColor = .white
//
//        setupConstraints()
//    }
//
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            collectionView.heightAnchor.constraint(equalToConstant: 400)
//        ])
//
//        NSLayoutConstraint.activate([
//            someLabel.topAnchor.constraint(equalTo: view.topAnchor),
//            someLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            someLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            someLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            someLabel.heightAnchor.constraint(equalToConstant: 400)
//        ])
//    }
//}
