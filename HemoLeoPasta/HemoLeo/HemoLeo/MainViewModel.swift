//
//  MainViewModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import UIKit

class MainViewModel {
    private var background = "default"
    private let sharedNSCoding = NSCodingManager.sharedNSCodingManager
    static let sharedMainModel = MainViewModel()
    
    private init() {
        
    }
    
    func getBackground() -> String {
        return background
    }
    
    func setBackgorund(bg : BG) {
        self.background = bg.rawValue
        sharedNSCoding.setBackground(bg: bg.rawValue)
    }
    
    func createButton(view: UIView, x: CGFloat, y: CGFloat, image: String, action: ()->()) {
        let button = UIButton(frame: CGRect(x: x, y: y, width: 70, height: 70))
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 75
        button.layer.masksToBounds = true
        button.layer.zPosition = 1000
        button.showsTouchWhenHighlighted = false
        button.reversesTitleShadowWhenHighlighted = false
        button.setImage(UIImage(named: image), for: .normal)
        
        view.addSubview(button)
    }
}
