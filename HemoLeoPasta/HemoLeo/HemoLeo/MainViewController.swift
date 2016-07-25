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
    
    var careCardButton: UIButton!
    var symptomCardButton: UIButton!
    var canvasButton: UIButton!
    var themesButton: UIButton!
    var insightCardButton: UIButton!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var background: String = "Default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        
//        defaults.setObject("Default", forKey: "Background")
        
        func prefersStatusBarHidden() -> Bool {
            return true
        }
        
        //Buttons
        
        //Button to CareCard
        careCardButton = UIButton(frame: CGRect(x: 934, y: 30, width: 70, height: 70))
        careCardButton.backgroundColor = UIColor.whiteColor()
        careCardButton.addTarget(self, action: #selector(careCardButtonAction), forControlEvents: .TouchUpInside)
        careCardButton.layer.cornerRadius = 35
        careCardButton.layer.masksToBounds = true
        careCardButton.layer.zPosition = 1000
        careCardButton.showsTouchWhenHighlighted = false
        careCardButton.reversesTitleShadowWhenHighlighted = false
        careCardButton.setImage(UIImage(named: "Health"), forState: .Normal)
        
        self.view.addSubview(careCardButton)
        
        //Button to SymptomCard
        symptomCardButton = UIButton(frame: CGRect(x: 834, y: 30, width: 70, height: 70))
        symptomCardButton.backgroundColor = UIColor.whiteColor()
        symptomCardButton.addTarget(self, action: #selector(symptomCardButtonAction), forControlEvents: .TouchUpInside)
        symptomCardButton.layer.cornerRadius = 35
        symptomCardButton.layer.masksToBounds = true
        symptomCardButton.layer.zPosition = 1000
        symptomCardButton.setImage(UIImage(named: "ActivityCheck"), forState: .Normal)
        
        self.view.addSubview(symptomCardButton)
        
        //Button to Canvas
        canvasButton = UIButton(frame: CGRect(x: 30, y: 30, width: 70, height: 70))
        canvasButton.backgroundColor = UIColor.whiteColor()
        canvasButton.addTarget(self, action: #selector(canvasButtonAction), forControlEvents: .TouchUpInside)
        canvasButton.layer.cornerRadius = 35
        canvasButton.layer.masksToBounds = true
        canvasButton.layer.zPosition = 1000
        canvasButton.setImage(UIImage(named: "Canvas"), forState: .Normal)
        
        self.view.addSubview(canvasButton)
        
        //Button to Themes
        themesButton = UIButton(frame: CGRect(x: 130, y: 30, width: 70, height: 70))
        themesButton.backgroundColor = UIColor.whiteColor()
        themesButton.addTarget(self, action: #selector(themesButtonAction), forControlEvents: .TouchUpInside)
        themesButton.layer.cornerRadius = 35
        themesButton.layer.masksToBounds = true
        themesButton.layer.zPosition = 1000
        themesButton.setImage(UIImage(named: "Botao Temas"), forState: .Normal)
        
        self.view.addSubview(themesButton)
        
        //Button to InsightCard
        insightCardButton = UIButton(frame: CGRect(x: 734, y: 30, width: 70, height: 70))
        insightCardButton.backgroundColor = UIColor.whiteColor()
        insightCardButton.addTarget(self, action: #selector(insightCardButtonAction), forControlEvents: .TouchUpInside)
        insightCardButton.layer.cornerRadius = 35
        insightCardButton.layer.masksToBounds = true
        insightCardButton.layer.zPosition = 1000
        insightCardButton.setImage(UIImage(named: "Insight"), forState: .Normal)
        
        self.view.addSubview(insightCardButton)

        
    }
    
    override func viewWillAppear(animated: Bool) {
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
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
    

    
    //MARK: - Buttons Actions and Popover
    
    //Care Card button action
    func careCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CareCard") as! CareCardViewController
        popoverViewController.modalPresentationStyle = .Popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.careCardButton
        popoverPresentationViewController?.sourceRect = CGRectMake(careCardButton.frame.width / 2, careCardButton.frame.height, 0, 0)
        
        ButtonAnimation.addButtonPressAnimationToView(careCardButton)
        
        presentViewController(popoverViewController, animated: true, completion: nil)
    }
    
    //Symptom Card button action
    func symptomCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SymptomCard") as! SymptomCardViewController
        popoverViewController.modalPresentationStyle = .Popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.symptomCardButton
        popoverPresentationViewController?.sourceRect = CGRectMake(symptomCardButton.frame.width / 2, symptomCardButton.frame.height, 0, 0)
        
        ButtonAnimation.addButtonPressAnimationToView(symptomCardButton)
        
        presentViewController(popoverViewController, animated: true, completion: nil)
    }
    
    //Insight Card button action
    func insightCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InsightCard") as! InsightViewController
        popoverViewController.modalPresentationStyle = .Popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.insightCardButton
        popoverPresentationViewController?.sourceRect = CGRectMake(insightCardButton.frame.width / 2, insightCardButton.frame.height, 0, 0)
        
        ButtonAnimation.addButtonPressAnimationToView(insightCardButton)
        
        presentViewController(popoverViewController, animated: true, completion: nil)
    }
    
    //Canvas button action
    func canvasButtonAction() {
        ButtonAnimation.addButtonPressAnimationToView(canvasButton)
        performSegueWithIdentifier("mainToCanvas", sender: self)
    }
    
    //Theme button action
    func themesButtonAction() {
        ButtonAnimation.addButtonPressAnimationToView(themesButton)
        performSegueWithIdentifier("mainToThemes", sender: self)
    }
    
}

//MARK: - UIPopoverPresentationControllerDelegate
extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
