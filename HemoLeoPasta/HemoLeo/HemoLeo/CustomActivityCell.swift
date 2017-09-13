//
//  CustomActivityCell.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 21/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func sliderDidChangeValue(newSliderValue: String)
}

class CustomActivityCell: UITableViewCell {
    @IBOutlet weak var check: UIImageView!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var colorMark: UIView!
    
    var value: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        check.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
