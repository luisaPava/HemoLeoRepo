//
//  File.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 20/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import UIKit

class ButtonAnimation {

    static func addButtonPressAnimationToView(viewToAnimate: UIView) {
        let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
        let overshootTiming = CAMediaTimingFunction(controlPoints: 0.00, 0.00, 0.58, 1.30)
        
        let modeloBotaoScaleXAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
        modeloBotaoScaleXAnimation.duration = 0.350
        modeloBotaoScaleXAnimation.values = [1.000 as Float, 0.800 as Float, 1.100 as Float, 1.000 as Float]
        modeloBotaoScaleXAnimation.keyTimes = [0.000 as NSNumber, 0.286 as NSNumber, 0.643 as NSNumber, 1.000 as NSNumber]
        modeloBotaoScaleXAnimation.timingFunctions = [anticOverTiming, anticOverTiming, overshootTiming]
        viewToAnimate.layer.add(modeloBotaoScaleXAnimation, forKey:"ButtonPress_ScaleX")
        
        let modeloBotaoScaleYAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        modeloBotaoScaleYAnimation.duration = 0.350
        modeloBotaoScaleYAnimation.values = [1.000 as Float, 0.800 as Float, 1.100 as Float, 1.000 as Float]
        modeloBotaoScaleYAnimation.keyTimes = [0.000 as NSNumber, 0.286 as NSNumber, 0.643 as NSNumber, 1.000 as NSNumber]
        modeloBotaoScaleYAnimation.timingFunctions = [anticOverTiming, anticOverTiming, overshootTiming]
        viewToAnimate.layer.add(modeloBotaoScaleYAnimation, forKey:"ButtonPress_ScaleY")
    }
}
