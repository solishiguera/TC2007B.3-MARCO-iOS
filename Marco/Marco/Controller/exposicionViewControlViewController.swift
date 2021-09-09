//
//  exposicionViewControlViewController.swift
//  Marco
//
//  Created by user193493 on 9/8/21.
//

import UIKit

class exposicionViewControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(false)
        // Do any additional setup after loading the view.
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
