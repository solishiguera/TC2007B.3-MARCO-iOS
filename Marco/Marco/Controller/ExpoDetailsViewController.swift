//
//  ExpoDetailsViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/7/21.
//

import UIKit

class ExpoDetailsViewController: UIViewController {
    var expo: Exposition!

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var startDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = expo.title
        startDate.text = expo.startDate
        
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
