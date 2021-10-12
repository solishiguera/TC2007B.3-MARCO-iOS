//
//  HomeViewController.swift
//  Marco
//
//  Created by Diego Solis on 9/8/21.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet var bttnComprarBoletos: UIButton!
    @IBOutlet weak var tag: UILabel!
    
    
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        bttnComprarBoletos.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        if Auth.auth().currentUser != nil{
            let user = Auth.auth().currentUser
            let uid : String = user!.uid
        db.collection("users").document(uid).getDocument{(doc, error) in
            let name = doc?.get("nombres")
            self.tag.text = name as? String
        }
        }
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

    @IBAction func comprarBoleto(_ sender: Any) {
        let buyTicketViewController = BuyTicketViewController(nibName: "BuyTicketViewController", bundle: nil)
        
        self.present(buyTicketViewController, animated: true, completion: nil)
    }
    
    @IBAction func logOut(_ sender: Any) {
        if Auth.auth().currentUser != nil{
            do {
                try? Auth.auth().signOut()
            }
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
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
