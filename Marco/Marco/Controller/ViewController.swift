//
//  ViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/6/21.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var loginBttn: UIButton!
    @IBOutlet var signupBttn: UIButton!
    @IBOutlet var guestBttn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // hola
        title = ""
        
        loginBttn.layer.cornerRadius = 5
        signupBttn.layer.cornerRadius = 5
        guestBttn.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}

