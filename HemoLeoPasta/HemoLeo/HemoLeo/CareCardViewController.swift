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
    private var viewController: OCKCareCardViewController! = nil
    private let careCardModel = CareCardModel.sharedCareCardModel
    
    fileprivate let calendarDAO = DAOCalendario.sharedDAOCalendario

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
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sair", style: .done, target: self, action: #selector(logOutAction))
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Nova", style: .plain, target: self, action: #selector(pushAddActivityController))
            
            viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor(netHex: 0x28B061)
            viewController.navigationItem.rightBarButtonItem?.tintColor = UIColor(netHex: 0x2ECC71)
            
            viewController.delegate = self
            
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
//        self.performSegue(withIdentifier: "careToUser", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.view.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "uservc")
        
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)

    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension CareCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}

extension CareCardViewController: OCKCareCardViewControllerDelegate {
    func careCardViewController(_ viewController: OCKCareCardViewController, didSelectButtonWithInterventionEvent interventionEvent: OCKCarePlanEvent) {
        if interventionEvent.activity.identifier == "Profilaxia" {
            calendarDAO.append(newEvent: "Profilaxia", withType: .Profilaxia)
        }
    }
}
