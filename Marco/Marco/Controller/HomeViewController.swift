//
//  HomeViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/8/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var bttnComprarBoletos: UIButton!
    @IBOutlet var bttnMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bttnComprarBoletos.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
