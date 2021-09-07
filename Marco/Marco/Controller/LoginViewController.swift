//
//  LoginViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/6/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var loginBttn: UIButton!
    @IBOutlet var signupBttn: UIButton!
    @IBOutlet var guestBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBttn.layer.cornerRadius = 5
        signupBttn.layer.cornerRadius = 5
        guestBttn.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
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
