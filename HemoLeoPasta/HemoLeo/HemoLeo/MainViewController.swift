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
    var tutorialButton: UIButton!
    var careCardButton: UIButton!
    var symptomCardButton: UIButton!
    var canvasButton: UIButton!
    var themesButton: UIButton!
    var insightCardButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    var background: String = "Default"
    
    private let mainModel = MainViewModel.sharedMainModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
        func prefersStatusBarHidden() -> Bool {
            return true
        }
        
        
        //Button to CareCard
        careCardButton = mainModel.createButton(view: self.view, x: width / 1.1, y: height / 25.6, image: #imageLiteral(resourceName: "Health"))
        careCardButton.addTarget(self, action: #selector(careCardButtonAction), for: .touchUpInside)
        
        self.view.addSubview(careCardButton)
        
        //Button to SymptomCard
        symptomCardButton = mainModel.createButton(view: self.view, x: width / 1.227, y: height / 25.6, image: #imageLiteral(resourceName: "ActivityCheck"))
        symptomCardButton.addTarget(self, action: #selector(symptomCardButtonAction), for: .touchUpInside)
    
        self.view.addSubview(symptomCardButton)
        
        //Button to Canvas
        canvasButton = mainModel.createButton(view: self.view, x: width / 34.133, y: height / 25.6, image: #imageLiteral(resourceName: "Canvas"))
        canvasButton.addTarget(self, action: #selector(canvasButtonAction), for: .touchUpInside)
        
        self.view.addSubview(canvasButton)
        
        //Button to Themes
        themesButton = mainModel.createButton(view: self.view, x: width / 7.876, y: height / 25.6, image: #imageLiteral(resourceName: "Botao Temas"))
        themesButton.addTarget(self, action: #selector(themesButtonAction), for: .touchUpInside)
        
        self.view.addSubview(themesButton)
        
        //Button to InsightCard
        insightCardButton = mainModel.createButton(view: self.view, x: width / 1.395, y: height / 25.6, image: #imageLiteral(resourceName: "Insight"))
        insightCardButton.addTarget(self, action: #selector(insightCardButtonAction), for: .touchUpInside)
        
        self.view.addSubview(insightCardButton)
        
        //Button to Tutorial
        tutorialButton = mainModel.createButton(view: self.view, x: width / 34.133, y: height / 1.15, image: #imageLiteral(resourceName: "Tutorial"))
        tutorialButton.addTarget(self, action: #selector(tutorialButtonAction), for: .touchUpInside)
        
        self.view.addSubview(tutorialButton)

        
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
        let popoverViewController = self.storyboard?.instantiateViewController(withIdentifier: "InsightCard") as! InsightsViewController
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
    
    //Tutorial button action
    func tutorialButtonAction() {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: tutorialButton)
        performSegue(withIdentifier: "mainToTutorial", sender: self)
    }
    
}

//MARK: - UIPopoverPresentationControllerDelegate
extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
