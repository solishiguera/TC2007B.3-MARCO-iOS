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
    
    @IBOutlet weak var videoBtn: UIButton!
    
    @IBOutlet weak var recorridoBtn: UIButton!
    
    
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
        videoBtn.layer.cornerRadius = 5
        recorridoBtn.layer.cornerRadius = 5
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func VideoPress(_ sender: Any) {
        let videoWebViewController = VideoWebViewController(nibName: "VideoWebViewController", bundle: nil)
        
        print("Expo Video URL")
        print(expo.videoURL)
        print(type(of: expo.videoURL))
        
        var nilcheck : String? = nil
        var auxstr : String = "https://www.marco.org.mx/"
        
        
        //auxstr = expo.videoURL!
        
        videoWebViewController.liga = expo.videoURL ?? "https://www.marco.org.mx/"
        
        //videoWebViewController.liga = auxstr
        self.present(videoWebViewController, animated: true, completion: nil)
    }
    
    @IBAction func RecorridoPressed(_ sender: Any) {
        let recorridoWebViewController = RecorridoWebViewController(nibName: "RecorridoWebViewController", bundle: nil)
        
        recorridoWebViewController.liga = expo.recorridoVirtual ?? "https://www.marco.org.mx/"
        self.present(recorridoWebViewController, animated: true, completion: nil)
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
