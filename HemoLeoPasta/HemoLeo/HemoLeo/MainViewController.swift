//
//  MainViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {
    
    let viewTransitionDelegate = TransitionDelegate()
    var careCardButton: UIButton!
    var symptomCardButton: UIButton!
    
    var background: String = "Default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeGesture))
//        self.view.userInteractionEnabled = true
//        self.view.addGestureRecognizer(swipeGestureRecognizer)

        // Do any additional setup after loading the view.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: background)!)
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        
        func prefersStatusBarHidden() -> Bool {
            return true
        }
        
        //Botões
        
        careCardButton = UIButton(frame: CGRect(x: 934, y: 30, width: 70, height: 70))
        careCardButton.backgroundColor = UIColor.whiteColor()
        careCardButton.addTarget(self, action: #selector(careCardButtonAction), forControlEvents: .TouchUpInside)
        careCardButton.layer.cornerRadius = 35
        careCardButton.layer.masksToBounds = true
        careCardButton.layer.zPosition = 1000
        careCardButton.setImage(UIImage(named: "Health"), forState: .Normal)
        
        self.view.addSubview(careCardButton)
        
        symptomCardButton = UIButton(frame: CGRect(x: 834, y: 30, width: 70, height: 70))
        symptomCardButton.backgroundColor = UIColor.whiteColor()
        symptomCardButton.addTarget(self, action: #selector(symptomCardButtonAction), forControlEvents: .TouchUpInside)
        symptomCardButton.layer.cornerRadius = 35
        symptomCardButton.layer.masksToBounds = true
        symptomCardButton.layer.zPosition = 1000
        symptomCardButton.setImage(UIImage(named: "ActivityCheck"), forState: .Normal)
        
        self.view.addSubview(symptomCardButton)
    }
    
    override func loadView() {
        self.view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Popover view
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "mainToCare" {
//            let popOverVC = segue.destinationViewController as! CareCardViewController
//            
//            popOverVC.popoverPresentationController?.delegate = self
//            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: -150, y: -100, width: 0, height: 0)
//            
//        } else if segue.identifier == "mainToSymptoms" {
//            let popOverVC = segue.destinationViewController as! SymptomCardViewController
//            
//            popOverVC.popoverPresentationController?.delegate = self
//            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: -150, y: -100, width: 0, height: 0)
//        }
//    }
    
    //MARK: - Buttons Actions
    func careCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CareCard") as! CareCardViewController
        popoverViewController.modalPresentationStyle = .Popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.careCardButton
        popoverPresentationViewController?.sourceRect = CGRectMake(careCardButton.frame.width / 2, careCardButton.frame.height, 0, 0)
        
        presentViewController(popoverViewController, animated: true, completion: nil)
    }
    
    func symptomCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SymptomCard") as! SymptomCardViewController
        popoverViewController.modalPresentationStyle = .Popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.symptomCardButton
        popoverPresentationViewController?.sourceRect = CGRectMake(symptomCardButton.frame.width / 2, symptomCardButton.frame.height, 0, 0)
        
        presentViewController(popoverViewController, animated: true, completion: nil)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
