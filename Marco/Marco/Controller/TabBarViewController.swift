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
        let controllers = [homeViewController, exposicionViewController]
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            tag: 1)
        
        exposicionViewController.tabBarItem = UITabBarItem(
            title: "Exposicion",
            image: UIImage(systemName: "house"),
            tag: 2)
        
        self.viewControllers = controllers
        
        //UIApplication.shared.windows.first?.rootViewController = tabBarController
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
