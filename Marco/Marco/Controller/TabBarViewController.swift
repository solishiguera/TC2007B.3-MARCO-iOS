//
//  TabBarViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/6/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let exposicionViewController = exposicionViewControlViewController(nibName: "exposicionViewControlViewController", bundle: nil)
        let ticketViewController = TicketViewController(nibName: "TicketViewController", bundle: nil)
        let restaurantViewController = RestaurantViewController(nibName: "RestaurantViewController", bundle: nil)
        
        let controllers = [homeViewController, exposicionViewController, ticketViewController, restaurantViewController]
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 1)
        
        restaurantViewController.tabBarItem = UITabBarItem(
            title: "Restaurante",
            image: UIImage(systemName: "fork.knife"),
            tag: 2)
        
        ticketViewController.tabBarItem = UITabBarItem(
            title: "Boletos",
            image: UIImage(systemName: "ticket"),
            tag: 3)
        
        exposicionViewController.tabBarItem = UITabBarItem(
            title: "Exposiciones",
            image: UIImage(systemName: "paintbrush"),
            tag: 4)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor(red: 0.79, green: 0.00, blue: 0.53, alpha: 1.0)
        self.viewControllers = controllers
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
