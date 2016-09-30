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
   
    
    override func viewWillAppear(_ animated: Bool) {
        
        viewController = createCareCardVC()
        self.pushViewController(viewController, animated: false)
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    private func createCareCardVC() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: storeManager.store)
        
        viewController.showEdgeIndicators = true
        
//        viewController.
        
        // Setup controller's title and tab bar icon
        viewController.title = "Cuidados"
        viewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        viewController.navigationItem.rightBarButtonItem?.title = "Hoje"
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Nova", style: .done, target: self, action: #selector(pushAddActivityController))
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red

        return viewController
    }
    
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
        // bug? exit segue doesn't dismiss so we do it manually...
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - User interaction functions
    
    // Instantiates the AddActivityTableViewController from Main.storyboard
    // and asks navigationController to show it.
    func pushAddActivityController() {
        self.performSegue(withIdentifier: "cardToAdd", sender: self)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension CareCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
