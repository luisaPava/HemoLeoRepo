//
//  TransitionDelegate.swift
//  ZappTest
//
//  Created by Sztanyi Szabolcs on 24/09/14.
//  Copyright (c) 2014 ZappDesignTemplates. All rights reserved.
//

//import UIKit
//
//class TransitionDelegate: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
//    private var presenting = false
//        
//    // MARK: UIViewControllerAnimatedTransitioning protocol methods
//        
//    // animate a change from one viewcontroller to another
//    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//            
//        // get reference to our fromView, toView and the container view that we should perform the transition in
//        let container = transitionContext.containerView()
//            
//        // create a tuple of our screens
//        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
//            
//        // assign references to our menu view controller and the 'bottom' view controller from the tuple
//        // remember that our menuViewController will alternate between the from and to view controller depending if we're presenting or dismissing
//        let menuViewController = !self.presenting ? screens.from as! AddActivityViewController : screens.to as! AddActivityViewController
//        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
//            
//        let menuView = menuViewController.view
//        let bottomView = bottomViewController.view
//            
//        // prepare menu items to slide in
//        if (self.presenting){
//            self.offStageMenuController(menuViewController)
//        }
//            
//        // add the both views to our view controller
//        container!.addSubview(bottomView)
//        container!.addSubview(menuView)
//        
//        let duration = self.transitionDuration(transitionContext)
//            
//            // perform the animation!
//        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options:.TransitionNone,animations: {
//            
//            if (self.presenting){
//                self.onStageMenuController(menuViewController) // onstage items: slide in
//                
//            } else {
//                self.offStageMenuController(menuViewController) // offstage items: slide out
//            }
//                
//            }, completion: { finished in
//                    
//                // tell our transitionContext object that we've finished animating
//                transitionContext.completeTransition(true)
//                    
//                // bug: we have to manually add our 'to view' back http://openradar.appspot.com/radar?id=5320103646199808
//                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
//                
//        })
//            
//    }
//    
//    func offStage(amount: CGFloat) -> CGAffineTransform {
//        return CGAffineTransformMakeTranslation(amount, 0)
//    }
//        
//    func offStageMenuController(menuViewController: AddActivityViewController) {
//        
//        menuViewController.view.alpha = 0
//            
//        // setup paramaters for 2D transitions for animations
//        let topRowOffset  :CGFloat = 300
//        let middleRowOffset :CGFloat = 150
//        let bottomRowOffset  :CGFloat = 50
//            
//        menuViewController.vegetableBtn.transform = self.offStage(-topRowOffset)
//        
//        menuViewController.waterBtn.transform = self.offStage(-middleRowOffset)
//        
//        menuViewController.fisiotherapyBtn.transform = self.offStage(-bottomRowOffset)
//        
//        menuViewController.fruitsBtn.transform = self.offStage(topRowOffset)
//            
//        menuViewController.exerciseBtn.transform = self.offStage(middleRowOffset)
//            
//        menuViewController.shotBtn.transform = self.offStage(bottomRowOffset)
//        
//    }
//        
//    func onStageMenuController(menuViewController: AddActivityViewController) {
//            
//        // prepare menu to fade in
//        menuViewController.view.alpha = 1
//    
//        menuViewController.vegetableBtn.transform = CGAffineTransformIdentity
//            
//        menuViewController.waterBtn.transform = CGAffineTransformIdentity
//            
//        menuViewController.fisiotherapyBtn.transform = CGAffineTransformIdentity
//            
//        menuViewController.fruitsBtn.transform = CGAffineTransformIdentity
//            
//        menuViewController.exerciseBtn.transform = CGAffineTransformIdentity
//            
//        menuViewController.shotBtn.transform = CGAffineTransformIdentity
//        
//    }
//        
//    // return how many seconds the transiton animation will take
//    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
//        return 0.5
//    }
//    
//    // MARK: UIViewControllerTransitioningDelegate protocol methods
//    
//    // return the animataor when presenting a viewcontroller
//    // rememeber that an animator (or animation controller) is any object that aheres to the UIViewControllerAnimatedTransitionin protocol
//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController,sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        self.presenting = true
//        return self
//    }
//    
//    // return the animator used when dismissing from a viewcontroller
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        self.presenting = false
//        return self
//    }
//}


