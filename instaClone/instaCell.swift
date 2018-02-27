//
//  instaCell.swift
//  instaClone
//
//  Created by Justin Lee on 2/26/18.
//  Copyright © 2018 Justin Lee. All rights reserved.
//

import UIKit
import ParseUI

class instaCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!

    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
