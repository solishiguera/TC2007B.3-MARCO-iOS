//
//  NewsDetailsViewController.swift
//  Marco
//
//  Created by Andres Piñones on 20/10/21.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    var new: News!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = new.title
        dateLbl.text = new.date
        descriptionLbl.text = new.description
        subtitleLbl.text = new.subtitle
        
        // Create URL
        guard let url = URL(string: new.photoUrl) else { return }
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                // Create Image and Update Image View
                image.image = UIImage(data: data)
            }
        
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
