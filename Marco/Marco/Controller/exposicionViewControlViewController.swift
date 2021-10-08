//
//  exposicionViewControlViewController.swift
//  Marco
//
//  Created by user193493 on 9/8/21.
//

import UIKit

class exposicionViewControlViewController: UIViewController {
    
    @IBOutlet var bttnMenu: UIButton!
    @IBOutlet var bttnBoletos: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
