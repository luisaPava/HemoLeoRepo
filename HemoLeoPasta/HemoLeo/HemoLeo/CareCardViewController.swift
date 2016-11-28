//
//  CareCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class CareCardViewController: UINavigationController {
    private var viewController: UIViewController! = nil
    private let careCardModel = CareCardModel.sharedCareCardModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        if self.viewControllers.isEmpty {
            viewController = careCardModel.createCareCard()
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logOutAction))
            
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nova", style: .plain, target: self, action: #selector(pushAddActivityController))
            viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor(netHex: 0xd53d55)
            self.pushViewController(viewController, animated: false)
        }
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
        // bug? exit segue doesn't dismiss so we do it manually...
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - User interaction functions
    func pushAddActivityController() {
        self.performSegue(withIdentifier: "cardToAdd", sender: self)
    }
    
    func logOutAction() {
        self.performSegue(withIdentifier: "careToUser", sender: self)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension CareCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
