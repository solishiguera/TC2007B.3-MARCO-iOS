//
//  RestaurantViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/11/21.
//

import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var menuBtn: UIButton!
    
    let pasteBoard = UIPasteboard.general
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Click_copyNum(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        pasteBoard.string = "528182624562"
        menuBtn.setTitle("¡Copiado!", for: .normal)
        UIView.animate(withDuration: 1.8,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.40),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
            self.menuBtn.setTitle(" para Reservar", for: .normal)
        }
               
    }
    @IBAction func animateButton(_ sender: UIButton) {

        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
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
