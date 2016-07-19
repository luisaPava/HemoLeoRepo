//
//  MainViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import SpriteKit

class SalvacaoViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    let viewTransitionDelegate = TransitionDelegate()
    
    
    @IBOutlet weak var careCardButton: UIButton!
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
        
        //careCardButton.layer.zPosition = 1
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainToCare" {
            let popOverVC = segue.destinationViewController as! CareCardViewController
            
            popOverVC.popoverPresentationController?.delegate = self
            popOverVC.popoverPresentationController?.sourceRect = CGRect(x: -150, y: -100, width: 0, height: 0)
            popOverVC.popoverPresentationController?.sourceView = 
            
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
