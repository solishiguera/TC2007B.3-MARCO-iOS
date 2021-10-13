//
//  TicketViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/6/21.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var comprarBoletoBtn: UIButton!
    @IBOutlet weak var visitaGuiadaBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        comprarBoletoBtn.layer.cornerRadius = 5
        visitaGuiadaBtn.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }

    @IBAction func comprarBoleto(_ sender: Any) {
        let buyTicketViewController = BuyTicketViewController(nibName: "BuyTicketViewController", bundle: nil)
        
        self.present(buyTicketViewController, animated: true, completion: nil)
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
