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
    
    var background: String = "Default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeGesture))
//        self.view.userInteractionEnabled = true
//        self.view.addGestureRecognizer(swipeGestureRecognizer)

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: background)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Popover view
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainToCare" {
            let popOverVC = segue.destinationViewController as! CareCardViewController
            
            popOverVC.popoverPresentationController?.delegate = self
            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: -150, y: -100, width: 0, height: 0)
            
        } else if segue.identifier == "mainToSymptoms" {
            let popOverVC = segue.destinationViewController as! SymptomCardViewController
            
            popOverVC.popoverPresentationController?.delegate = self
            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: -150, y: -100, width: 0, height: 0)
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
