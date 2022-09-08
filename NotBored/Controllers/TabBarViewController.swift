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
        setupControllers()
        ApiCaller.shared.getActivity(participants: nil, price: 0.2, type: .cooking) { result in
            switch result {
                case .success(let activity):
                    print(activity)
                case .failure(let error):
                    print(error)
            }
        }
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
        let pruebaVC = UINavigationController(rootViewController: ViewController())
        
        categoriesVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "list.bullet"), tag: 1)
        pruebaVC.tabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "shuffle"), tag: 1)
        
        categoriesVC.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
        pruebaVC.tabBarItem.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)

        setViewControllers([categoriesVC, pruebaVC], animated: true)


        //Setup titles
//        pruebaVC.title = "Random"
//        categoriesVC.title = "Categories"
//
//        //Add view controllers to tabBar
//        setViewControllers([categoriesVC, pruebaVC], animated: false)
//
//        //Setup images and font styles
//        let images = ["list.bullet", "shuffle"]
//
//        tabBar.items?.enumerated().forEach({ index, item in
//            item.image = UIImage(systemName: images[index])
//            item.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
//        })
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
            if selectedIndex == 1{
                //Do anything.
                let prueba = ActivityDetailViewController()
                prueba.modalPresentationStyle = .fullScreen
                navigationController?.pushViewController(prueba, animated: true)
                return false
            }
            return true
        }
}


