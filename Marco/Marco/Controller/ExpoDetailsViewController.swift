//
//  ExpoDetailsViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/7/21.
//

import UIKit

class ExpoDetailsViewController: UIViewController {
    var expo: Exposition!

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var cerraduriaLbl: UILabel!
    
    @IBOutlet weak var museografiaLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = expo.title
        startDate.text = expo.startDate
        descriptionLbl.text = expo.description
        cerraduriaLbl.text = expo.cerraduria
        museografiaLbl.text = expo.museografia
        
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
