//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Semyon on 10.07.2022.
//

import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .systemGray6
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let feedViewController = createNavController(
            vc: FeedViewController(),
            itemName: "Feed",
            itemImage: "quote.bubble")
        
        let profileViewController = createNavController(
            vc: ProfileViewController(),
            itemName: "Profile",
            itemImage: "person.crop.rectangle")
        
        viewControllers = [feedViewController, profileViewController]
    }
    
    private func createNavController(
        vc: UIViewController,
        itemName: String,
        itemImage: String
    ) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}
