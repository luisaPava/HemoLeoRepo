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
    
    let defaults = UserDefaults.standard
    
    var background: String = "Default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        print("\(self.view.bounds.height) - \(self.view.bounds.width)")
        
        func prefersStatusBarHidden() -> Bool {
            return true
        }
        
        //Buttons
        
        //Button to CareCard
        careCardButton = UIButton(frame: CGRect(x: width / 1.096, y: height / 25.6, width: width / 14.628, height: height / 10.971))
        careCardButton.backgroundColor = UIColor.white
        careCardButton.addTarget(self, action: #selector(careCardButtonAction), for: .touchUpInside)
        careCardButton.layer.cornerRadius = width / 29.25
        careCardButton.layer.masksToBounds = true
        careCardButton.layer.zPosition = 1000
        careCardButton.showsTouchWhenHighlighted = false
        careCardButton.reversesTitleShadowWhenHighlighted = false
        careCardButton.setImage(UIImage(named: "Health"), for: .normal)
        
        self.view.addSubview(careCardButton)
        
        //Button to SymptomCard
        symptomCardButton = UIButton(frame: CGRect(x: width / 1.227, y: height / 25.6, width: width / 14.628, height: height / 10.971))
        symptomCardButton.backgroundColor = UIColor.white
        symptomCardButton.addTarget(self, action: #selector(symptomCardButtonAction), for: .touchUpInside)
        symptomCardButton.layer.cornerRadius = width / 29.25
        symptomCardButton.layer.masksToBounds = true
        symptomCardButton.layer.zPosition = 1000
        symptomCardButton.setImage(UIImage(named: "ActivityCheck"), for: .normal)
        
        self.view.addSubview(symptomCardButton)
        
        //Button to Canvas
        canvasButton = UIButton(frame: CGRect(x: width / 34.133, y: height / 25.6, width: width / 14.628, height: height / 10.971))
        canvasButton.backgroundColor = UIColor.white
        canvasButton.addTarget(self, action: #selector(canvasButtonAction), for: .touchUpInside)
        canvasButton.layer.cornerRadius = width / 29.25
        canvasButton.layer.masksToBounds = true
        canvasButton.layer.zPosition = 1000
        canvasButton.setImage(UIImage(named: "Canvas"), for: .normal)
        
        self.view.addSubview(canvasButton)
        
        //Button to Themes
        themesButton = UIButton(frame: CGRect(x: width / 7.876, y: height / 25.6, width: width / 14.628, height: height / 10.971))
        themesButton.backgroundColor = UIColor.white
        themesButton.addTarget(self, action: #selector(themesButtonAction), for: .touchUpInside)
        themesButton.layer.cornerRadius = width / 29.25
        themesButton.layer.masksToBounds = true
        themesButton.layer.zPosition = 1000
        themesButton.setImage(UIImage(named: "Botao Temas"), for: .normal)
        
        self.view.addSubview(themesButton)
        
        //Button to InsightCard
        insightCardButton = UIButton(frame: CGRect(x: width / 1.395, y: height / 25.6, width: width / 14.628, height: height / 10.971))
        insightCardButton.backgroundColor = UIColor.white
        insightCardButton.addTarget(self, action: #selector(insightCardButtonAction), for: .touchUpInside)
        insightCardButton.layer.cornerRadius = width / 29.25
        insightCardButton.layer.masksToBounds = true
        insightCardButton.layer.zPosition = 1000
        insightCardButton.setImage(UIImage(named: "Insight"), for: .normal)
        
        self.view.addSubview(insightCardButton)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override func loadView() {
        self.view = SKView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - Buttons Actions and Popover
    
    //Care Card button action
    func careCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewController(withIdentifier: "CareCard") as! CareCardViewController
        popoverViewController.modalPresentationStyle = .popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.careCardButton
        popoverPresentationViewController?.sourceRect = CGRect(x: careCardButton.frame.width / 2, y: careCardButton.frame.height, width: 0, height: 0)
        
        
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: careCardButton)
        
        present(popoverViewController, animated: true, completion: nil)
    }
    
    //Symptom Card button action
    func symptomCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewController(withIdentifier: "SymptomCard") as! SymptomCardViewController
        popoverViewController.modalPresentationStyle = .popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.symptomCardButton
        popoverPresentationViewController?.sourceRect = CGRect(x: symptomCardButton.frame.width / 2, y: symptomCardButton.frame.height, width: 0, height: 0)
        
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: symptomCardButton)
        
        present(popoverViewController, animated: true, completion: nil)
    }
    
    //Insight Card button action
    func insightCardButtonAction() {
        let popoverViewController = self.storyboard?.instantiateViewController(withIdentifier: "InsightCard") as! InsightViewController
        popoverViewController.modalPresentationStyle = .popover
        
        let popoverPresentationViewController = popoverViewController.popoverPresentationController
        
        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popoverPresentationViewController?.delegate = self
        popoverPresentationViewController?.sourceView = self.insightCardButton
        popoverPresentationViewController?.sourceRect = CGRect(x: insightCardButton.frame.width / 2, y: insightCardButton.frame.height, width: 0, height: 0)
        
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: insightCardButton)
        
        present(popoverViewController, animated: true, completion: nil)
    }
    
    //Canvas button action
    func canvasButtonAction() {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: canvasButton)
        performSegue(withIdentifier: "mainToCanvas", sender: self)
    }
    
    //Theme button action
    func themesButtonAction() {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: themesButton)
        performSegue(withIdentifier: "mainToThemes", sender: self)
    }
    
}

//MARK: - UIPopoverPresentationControllerDelegate
extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
