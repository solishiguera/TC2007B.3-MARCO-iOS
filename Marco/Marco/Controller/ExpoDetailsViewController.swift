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
    
    @IBOutlet weak var salasLbl: UILabel!
    
    @IBOutlet weak var tecnicaLbl: UILabel!
    
    @IBOutlet weak var obrasLbl: UILabel!
    
    @IBOutlet weak var recorridoVirtualLbl: UIButton!
    
    @IBOutlet weak var videoUrlLbl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = expo.title
        startDate.text = expo.startDate
        descriptionLbl.text = expo.description
        cerraduriaLbl.text = expo.cerraduria
        museografiaLbl.text = expo.museografia
        salasLbl.text = expo.salas
        tecnicaLbl.text = expo.tecnica
        obrasLbl.text = expo.obras
        
        // Do any additional setup after loading the view.
    }


    @IBAction func videoPressed(_ sender: Any) {
        let videoViewController = VideoViewController(nibName: "VideoViewController", bundle: nil)
        videoViewController.url = URL(fileReferenceLiteralResourceName: expo.videoURL ?? "https://www.marco.org.mx/exposiciones_actuales/")
        self.present(videoViewController, animated: true, completion: nil)
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
