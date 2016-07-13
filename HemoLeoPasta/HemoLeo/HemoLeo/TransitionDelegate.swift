//
//  TransitionDelegate.swift
//  ZappTest
//
//  Created by Sztanyi Szabolcs on 24/09/14.
//  Copyright (c) 2014 ZappDesignTemplates. All rights reserved.
//

import UIKit

class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let presentationAnimator = SlideInPresentationAnimator()
//        let presentationAnimator = TransitionPresentationAnimator()
        return presentationAnimator
    }

    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let dismissalAnimator = SlideInDismissalAnimator()
//        let dismissalAnimator = TransitionDismissalAnimator()
        return dismissalAnimator
    }
}
