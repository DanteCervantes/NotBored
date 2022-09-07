//
//  TabBarController.swift
//  NotBored
//
//  Created by Nicolas Alejandro Ferrero on 06/09/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupTabBarStyle()
        setupControllers()
    }
    
    private func setupTabBarStyle() {
        self.tabBar.backgroundColor = UIColor(named: "Blue Primary")
        self.tabBar.tintColor = UIColor(named: "Blue Secondary")
        self.tabBar.unselectedItemTintColor = .black
    }
    
    private func setupControllers() {
        //Setup view contollers
        let categoriesVC = CategoriesViewController()
        let pruebaVC = ViewController()

        //Setup titles
        pruebaVC.title = "Random"
        categoriesVC.title = "Categories"
        
        //Add view controllers to tabBar
        setViewControllers([categoriesVC, pruebaVC], animated: false)
        
        //Setup images and font styles
        let images = ["list.bullet", "shuffle"]
                
        tabBar.items?.enumerated().forEach({ index, item in
            item.image = UIImage(systemName: images[index])
            item.setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
        })
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            //Llamo al componente de category pasadole el type de actividad
        }
   }
}


