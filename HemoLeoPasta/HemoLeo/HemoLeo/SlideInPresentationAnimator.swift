//
//  SlideInPresentationAnimator.swift
//  ZappTest
//
//  Created by Sztanyi Szabolcs on 07/02/15.
//  Copyright (c) 2015 ZappDesignTemplates. All rights reserved.
//

import UIKit

class SlideInPresentationAnimator: NSObject , UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        
        let animationDuration = self .transitionDuration(transitionContext)
        
        // take a snapshot of the detail ViewController so we can do whatever with it (cause it's only a view), and don't have to care about breaking constraints
        let snapshotView = toViewController.view.resizableSnapshotViewFromRect(toViewController.view.frame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
        // move it to the right side of the screen, off the screen
        snapshotView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(containerView!.frame), 0.0)
        containerView!.addSubview(snapshotView)
        
        // hide the detail view until the snapshot is being animated
        toViewController.view.alpha = 0.0
        containerView!.addSubview(toViewController.view)
        
        let newXOriginOfView: CGFloat = 50
        UIView.animateWithDuration(animationDuration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 20.0, options: [],
            animations: { () -> Void in
                snapshotView.transform = CGAffineTransformMakeTranslation(newXOriginOfView, 0.0)
            }, completion: { (finished) -> Void in
                snapshotView.removeFromSuperview()
                toViewController.view.frame = CGRectMake(newXOriginOfView, 0.0, CGRectGetWidth(containerView!.frame), CGRectGetHeight(containerView!.frame))
                toViewController.view.alpha = 1.0
                transitionContext.completeTransition(finished)
        })
    }
    
}