//
//  MainTabBarController.swift
//  PizzaApp
//
//  Created by Liz Alpizar on 29/06/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pizzaListVC = PizzaListViewController()
        let myPizzasVC = MyPizzasViewController()
        let pizzeriaListVC = PizzeriaListViewController()

        pizzaListVC.tabBarItem = UITabBarItem(title: "Pizzas", image: UIImage(systemName: "list.bullet"), tag: 0)
        myPizzasVC.tabBarItem = UITabBarItem(title: "My Pizzas", image: UIImage(systemName: "star"), tag: 1)
        pizzeriaListVC.tabBarItem = UITabBarItem(title: "Pizzerias", image: UIImage(systemName: "map"), tag: 2)
        
        let controllers = [pizzaListVC, myPizzasVC, pizzeriaListVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }
}
