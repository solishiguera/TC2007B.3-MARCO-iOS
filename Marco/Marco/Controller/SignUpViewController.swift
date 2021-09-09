//
//  SignUpViewController.swift
//  Marco
//
//  Created by Andres Piñones on 06/09/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet var registrar: UIButton!
    
    @IBOutlet weak var nombreField: UITextField!
    
    @IBOutlet weak var primerApellidoField: UITextField!
    
    @IBOutlet weak var segundoApellidoField: UITextField!
    
    @IBOutlet weak var correoField: UITextField!
    
    @IBOutlet weak var confirmarCorreoField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBOutlet weak var labelTop: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registrar.layer.cornerRadius = 5
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        viewWillDisappear(false)
        // pop view controller
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
    
    func passwordValid(_ password : String) -> Bool{
        let test = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        return test.evaluate(with: password)
    }
        
    //Revisar si datos son validos
    func validarDatos() ->String? {
        //Revisar que los espacios obligatorios esten llenos
        if nombreField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || primerApellidoField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            segundoApellidoField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            correoField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmarCorreoField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.displayAlert(title: "Error", message:"Datos Incompletos")
        }
        //Revisar si los correos son iguales
        if correoField.text != confirmarCorreoField.text {
            self.displayAlert(title: "Error", message:"Correos no coinciden")
            return "Error Correos"
        }
        //Revisar si las contraseñas soin iguales
        if passwordField.text != confirmPasswordField.text {
            self.displayAlert(title: "Error", message:"Contraseñas no coinciden")
            return "Error Contraseña"
        }
        let cleanPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //Revisar si contraseña es fuerte
        if passwordValid(cleanPassword) == false{
            self.displayAlert(title: "Error", message:"Contraseñas debil")
            return "Contraseña Debil"
        }
        
        
        return nil
    }
    
    
    @IBAction func registroTap(_ sender: Any) {
        //Validar Datos
        let error = validarDatos()
        
        if error != nil{
            labelTop.text = error!
        }else{
            let nombre = nombreField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let apellidoP = primerApellidoField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let apellidoM = segundoApellidoField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let correo = correoField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Crear Usuario
            
            Auth.auth().createUser(withEmail: correo, password: password) { result, err in
                if err != nil{
                    self.displayAlert(title: "Error", message: err?.localizedDescription ?? "")
                    print(err)
                    self.labelTop.text = "Error al crear"
                }else{
                    print("Usuario registrado \(result?.user.uid ?? "")")
                    let db = Firestore.firestore()

                    db.collection("users").addDocument(data: ["nombres" : nombre, "apellidoUno" : apellidoP, "apellidoDos" : apellidoM, "uid" : result!.user.uid]) { error in
                        if error != nil {
                            self.labelTop.text = "Error en DB"
                        } else {
                            //manda a pagina de login
                            self.navigationController?.popViewController(animated: true)
                        }
                    }
                }
            }
        }
    }
    
    
}
