//
//  ViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/6/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var loginBttn: UIButton!
    @IBOutlet var signupBttn: UIButton!
    @IBOutlet var guestBttn: UIButton!
    
    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
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
    
    @IBAction func loginTapped(_ sender: Any) {
        if userField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.errorLabel.text = "Datos Faltantes"
        }else{
            let correo = userField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: correo, password: password) { result, err in
                if err != nil {
                    self.errorLabel.text = "Datos Incorrectos"
                }else{
                    //ir a pantalla inicio
                    self.errorLabel.text = "Logged In"
                }
            }
            
        }
        
    }
    
    
    
}

