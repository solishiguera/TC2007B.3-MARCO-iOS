//
//  RecorridoWebViewController.swift
//  Marco
//
//  Created by user189689 on 10/11/21.
//

import UIKit
import WebKit

class RecorridoWebViewController: UIViewController, WKNavigationDelegate {

    var liga = "https://www.marco.org.mx/"
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        print(liga)
        let url = URL(string: liga)!
        webView.load(URLRequest(url: url))

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
