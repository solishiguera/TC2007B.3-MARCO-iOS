//
//  Extensions.swift
//  Marco
//
//  Created by Andres Piñones on 08/09/21.
//

import UIKit
extension UIViewController{
    func displayAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action =  UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
