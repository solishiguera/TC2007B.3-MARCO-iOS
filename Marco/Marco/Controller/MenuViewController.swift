//
//  MenuViewController.swift
//  Marco
//
//  Created by Andres Piñones on 08/09/21.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var bttnExpo: UIButton!
    @IBOutlet weak var bttnVisitas: UIButton!
    @IBOutlet weak var bttnCalendario: UIButton!
    @IBOutlet weak var bttnReserva: UIButton!
    @IBOutlet var bttnComprarBoletos: UIButton!
    
    @IBOutlet var bttnInicio: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(false)
        bttnComprarBoletos.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func exitBttnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func bttnExpoPressed(_ sender: Any) {
        let exposicionUpViewController = exposicionViewControlViewController(nibName: "exposicionViewControlViewController", bundle: nil)
        exposicionUpViewController.modalPresentationStyle = .fullScreen
        present(exposicionUpViewController, animated: true, completion: nil)
    }
    
    @IBAction func bttnInicioPressed(_ sender: Any) {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
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
