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
    
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    private var viewController: UIViewController! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        viewController = createCareCardVC()
        self.pushViewController(viewController, animated: false)
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func createCareCardVC() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: storeManager.store)
        
        viewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        viewController.title = "Cuidados"
        viewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "+", style: .Plain, target: self, action: #selector(pushAddActivityController))
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.redColor()

        return viewController
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
        // bug? exit segue doesn't dismiss so we do it manually...
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: - User interaction functions
    
    // Instantiates the AddActivityTableViewController from Main.storyboard
    // and asks navigationController to show it.
    func pushAddActivityController() {
//        guard let addActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") else { return }
//        
//        self.presentViewController(addActivityTableVC, animated: true, completion: nil)
        
//        let modal = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") as! AddActivityViewController
//        popoverViewController.modalPresentationStyle = .Popover
//        
//        let popoverPresentationViewController = popoverViewController.popoverPresentationController
//        
//        let view = self.viewController.navigationItem.leftBarButtonItem?.valueForKey("view") as? UIView
//        
//        popoverPresentationViewController?.permittedArrowDirections = UIPopoverArrowDirection.Up
//        popoverPresentationViewController?.delegate = self
//        popoverPresentationViewController?.sourceView = view
//        popoverPresentationViewController?.sourceRect = CGRectMake(view!.frame.width / 2, view!.frame.height, 0, 0)
        
        
        
//        presentViewController(popoverViewController, animated: true, completion: nil)
        
        self.performSegueWithIdentifier("cardToAdd", sender: self)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension CareCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
