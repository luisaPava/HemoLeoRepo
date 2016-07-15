//
//  CareCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class CareCardViewController: UINavigationController /*OCKCareCardViewController*/ {
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        addTylenolActivity()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
//        self.presentViewController(createCareCardVC(), animated: true, completion: nil)
        self.pushViewController(createCareCardVC(), animated: false)
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
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Activity", style: .Plain, target: self, action: #selector(pushAddActivityController))
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.redColor()

        return viewController
    }
    
    
    // MARK: - User interaction functions
    
    // Instantiates the AddActivityTableViewController from Main.storyboard
    // and asks navigationController to show it.
    func pushAddActivityController() {
        guard let addActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") else { return }
        
        self.presentViewController(addActivityTableVC, animated: true, completion: nil)
    }
}
