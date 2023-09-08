//
//  HomeTabBarViewController.swift
//  FoodProject
//
//  Created by Балауса Косжанова on 25.11.2022.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    let vc1 = UINavigationController(rootViewController: HomeViewController())
    let vc2 = UINavigationController(rootViewController: ProfileViewController())
    let vc3 = UINavigationController(rootViewController: FavoriteListViewController())
    let vc4 = UINavigationController(rootViewController: MyCardListViewController())
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
     }


    override func viewDidLoad() {
        tabBar.backgroundColor = .black
        super.viewDidLoad()
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        vc1.tabBarItem.image = UIImage(systemName: "homekit")
        vc2.tabBarItem.image = UIImage(systemName: "person")
        vc3.tabBarItem.image = UIImage(systemName: "heart")
        vc4.tabBarItem.image = UIImage(systemName: "basket")
        self.tabBar.tintColor = .yellow
        
        UITabBar.appearance().unselectedItemTintColor = .white
        
        
        
        // Do any additional setup after loading the view.
    }
    
    

  

}
