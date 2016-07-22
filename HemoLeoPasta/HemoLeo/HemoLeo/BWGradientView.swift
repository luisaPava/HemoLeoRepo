//
//  BWGradientView.swift
//  testeDesignable
//
//  Created by Luisa Mello on 5/18/16.
//  Copyright © 2016 Luisa. All rights reserved.
//

import UIKit

@IBDesignable class BWGradientView: UIView {

    // MARK: Inspectable properties ******************************
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {didSet{setupView()}
    }
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {didSet{setupView()}
    }
    @IBInspectable var isHorizontal: Bool = false
        {didSet{setupView()}
    }
    @IBInspectable var roundness: CGFloat = 0.0
        {didSet{setupView()}
    }
    
    // MARK: Internal functions *********************************
    
    // Setup the view appearance
    private func setupView(){
        
        let colors:Array = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    // MARK: Overrides ******************************************
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }

}


