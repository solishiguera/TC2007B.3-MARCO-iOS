//
//  VideoViewController.swift
//  Marco
//
//  Created by Diego Solis on 10/11/21.
//

import UIKit
import WebKit

class VideoViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    var url: URL?
    
    var expo: Exposition!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
                
        
        //webView.load(URLRequest(url: url ?? "https://www.marco.org.mx/"))
        
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
