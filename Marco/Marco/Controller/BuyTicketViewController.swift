//
//  BuyTicketViewController.swift
//  Marco
//
//  Created by user189689 on 10/6/21.
//

import UIKit
import WebKit

class BuyTicketViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
                
        let url = URL(string: "https://factura.marco.org.mx/tickets_marco/")!
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
