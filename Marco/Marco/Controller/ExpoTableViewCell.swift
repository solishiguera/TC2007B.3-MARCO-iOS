//
//  ExpoTableViewCell.swift
//  Marco
//
//  Created by Diego Solis on 10/20/21.
//

import UIKit

class ExpoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var expoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
