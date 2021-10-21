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
    @IBOutlet weak var expoImage: UIImageView!
    
    @IBOutlet weak var recorridoBtn: UIButton!
    
    @IBOutlet weak var videoWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = expo.title
        
        descriptionLbl.text = expo.description
        cerraduriaLbl.text = expo.cerraduria
        museografiaLbl.text = expo.museografia
        salasLbl.text = expo.salas
        tecnicaLbl.text = expo.tecnica
        obrasLbl.text = expo.obras
        
        let string = expo.startDate
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        let date = dateFormatter.date(from: string)!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = tempLocale
        startDate.text = dateFormatter.string(from: date)
        
        // Create URL
        var myUrl = expo.photoUrl
        if(myUrl.contains("http://")) {
            let fourthIndex = myUrl.index(myUrl.startIndex, offsetBy: 4)
            myUrl.insert("s", at: fourthIndex)
        }
        
        guard let url = URL(string: myUrl) else { return }
        
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            expoImage.image = UIImage(data: data)
        }
        
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
