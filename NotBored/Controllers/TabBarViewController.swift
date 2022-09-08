//
//  TabBarController.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 06/09/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    var participants: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupControllers()
    }

    private func setupTabBarStyle() {
        self.tabBar.backgroundColor = UIColor(named: "Blue Primary")
        self.tabBar.tintColor = UIColor(named: "Blue Secondary")
        self.tabBar.unselectedItemTintColor = .black
    }
    
    private func setupControllers() {
        //Setup view contollers
        let vc1 = CategoriesViewController()
        vc1.participants = participants
        let categoriesVC = UINavigationController(rootViewController: vc1)
        let randomVC = UINavigationController(rootViewController: ViewController())
        
        categoriesVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "list.bullet"), tag: 1)
        randomVC.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "shuffle"), tag: 1)
        
        categoriesVC.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
        randomVC.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)

        setViewControllers([categoriesVC, randomVC], animated: true)
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if selectedIndex == 1{
                let randomVC = ActivityDetailViewController()
                randomVC.selectedParticipants = participants
                randomVC.isRandomlySelected = true
                randomVC.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(randomVC, animated: true)
                return false
            }
            return true
        }
}


