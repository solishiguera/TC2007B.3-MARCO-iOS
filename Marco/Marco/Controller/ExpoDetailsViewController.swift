//
//  ExpoDetailsViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/7/21.
//

import UIKit
import WebKit

class ExpoDetailsViewController: UIViewController {
    var expo: Exposition!
    var videoID: String!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var cerraduriaLbl: UILabel!
    @IBOutlet weak var museografiaLbl: UILabel!
    @IBOutlet weak var salasLbl: UILabel!
    @IBOutlet weak var tecnicaLbl: UILabel!
    @IBOutlet weak var obrasLbl: UILabel!

    @IBOutlet weak var recorridoBtn: UIButton!
    
    @IBOutlet weak var videoWebView: WKWebView!
    
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
        recorridoBtn.layer.cornerRadius = 5
        if expo.videoUrl != "" {
            getVideo()
        }
        else {
            videoWebView.isHidden = true
        }
    }
    

    func getVideoID(videoUrl: String) -> [String]{
            let regex = try! NSRegularExpression(pattern: "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)")

            let results = regex.matches(in: videoUrl,
                                              range: NSRange(videoUrl.startIndex..., in: videoUrl))
            return results.map {
                      String(videoUrl[Range($0.range, in: videoUrl)!])
            }
                
    }
     
    func getVideo(){
        let matched = getVideoID(videoUrl: expo.videoUrl!)
        let url = URL(string: "https://www.youtube.com/embed/\(matched[0])")
        videoWebView.load(URLRequest(url: url!))
    }
    
    @IBAction func RecorridoPressed(_ sender: Any) {
        let recorridoWebViewController = RecorridoWebViewController(nibName: "RecorridoWebViewController", bundle: nil)
        
        recorridoWebViewController.liga = expo.recorridoVirtual
        self.present(recorridoWebViewController, animated: true, completion: nil)
    }
}
