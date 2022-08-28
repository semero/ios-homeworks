//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Semyon on 11.08.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate lazy var photos: [Photo] = Photo.make()
    
    fileprivate enum LayoutConstant {
        static let itemInset: CGFloat = 12.0
        static let itemSpacing: CGFloat = 8.0
        static let itemSize: CGFloat = (UIScreen.main.bounds.width -
                                        LayoutConstant.itemSpacing * 3 -
                                        LayoutConstant.itemInset * 2) / 4
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.sectionInset = UIEdgeInsets(top: LayoutConstant.itemInset,
                                               left: LayoutConstant.itemInset,
                                               bottom: LayoutConstant.itemInset,
                                               right: LayoutConstant.itemInset
        )
        viewLayout.itemSize = CGSize(width: LayoutConstant.itemSize,
                                     height: LayoutConstant.itemSize
        )
        viewLayout.minimumInteritemSpacing = 8
//        viewLayout.minimumLineSpacing = 0
//        viewLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: viewLayout
        )
//        collectionView.backgroundColor = .systemOrange  // ---
        collectionView.isScrollEnabled = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        contentView.addSubview(label)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: LayoutConstant.itemSize +
                                                   LayoutConstant.itemInset * 2)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath) as! CustomCollectionViewCell
        
        let profile = photos[indexPath.row]
        cell.setup(with: profile)
        
        return cell
    }
}

//extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {}
