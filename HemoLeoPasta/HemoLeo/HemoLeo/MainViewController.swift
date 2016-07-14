//
//  MainViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    let viewTransitionDelegate = TransitionDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeGesture))
//        self.view.userInteractionEnabled = true
//        self.view.addGestureRecognizer(swipeGestureRecognizer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainToCare" {
            let popOverVC = segue.destinationViewController as! CareCardViewController
            
            popOverVC.popoverPresentationController?.delegate = self
            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: 500, y: -100, width: 0, height: 0)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "mainToCare" {
//            let vc = segue.destinationViewController as! CareCardViewController
//            vc.transitioningDelegate = viewTransitionDelegate
//            vc.modalPresentationStyle = .Custom
//        }
//    }
    
//    func swipeGesture() {
//        performSegueWithIdentifier("mainToCanvas", sender: self)
//    }
}
