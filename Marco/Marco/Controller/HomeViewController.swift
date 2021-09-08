//
//  HomeViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/8/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var bttnMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewWillDisappear(false)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func bttnMenuPressed(_ sender: Any) {
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
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
