//
//  SlideInDismissalAnimator.swift
//  ZappTest
//
//  Created by Sztanyi Szabolcs on 07/02/15.
//  Copyright (c) 2015 ZappDesignTemplates. All rights reserved.
//

import UIKit

class SlideInDismissalAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()
        
        let animationDuration = self .transitionDuration(transitionContext)
        
        // Create a snapShot of the view, and move it to the right initial place
        let snapshotView = fromViewController.view.resizableSnapshotViewFromRect(fromViewController.view.bounds, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
        snapshotView.transform = CGAffineTransformMakeTranslation(50.0, 0.0)
        containerView!.addSubview(snapshotView)
        
        fromViewController.view.alpha = 0.0
        
        let toViewControllerSnapshotView = toViewController.view.resizableSnapshotViewFromRect(toViewController.view.frame, afterScreenUpdates: true, withCapInsets: UIEdgeInsetsZero)
        containerView!.insertSubview(toViewControllerSnapshotView, belowSubview: snapshotView)
        
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            snapshotView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(containerView!.frame), 0.0)
        }) { (finished) -> Void in
            toViewControllerSnapshotView.removeFromSuperview()
            snapshotView.removeFromSuperview()
            fromViewController.view.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}