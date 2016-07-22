//
//  CustomActivityCell.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 21/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class CustomActivityCell: UITableViewCell {
    @IBOutlet weak var check: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var ocurrencesLabel: UILabel!
    @IBOutlet weak var roundImage: UIImageView!
    @IBOutlet weak var slExperienceLevel: UISlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if slExperienceLevel != nil {
            slExperienceLevel.minimumValue = 0.0
            slExperienceLevel.maximumValue = 10.0
            slExperienceLevel.value = 0.0
        }

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
