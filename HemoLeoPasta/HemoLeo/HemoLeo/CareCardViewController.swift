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
    
    
    func addTylenolActivity() {
        var tylenolActivity : OCKCarePlanActivity!
        let startdate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startdate, occurrencesOnEachDay: [1,0,2,0,2,0,1])
        
        tylenolActivity = OCKCarePlanActivity.interventionWithIdentifier("tylenol", groupIdentifier: "medicamentos", title: "Tylenol", text: "750mg", tintColor: UIColor.blueColor(), instructions: "bla bla bla", imageURL: nil, schedule: schedule, userInfo: nil)
        
        
        storeManager.store.addActivity(tylenolActivity) { (success, error) in
            if error != nil {
                print("Erro ao adicionar atividade do tylenol")
            }
        }
    }
    
    private func createCareCardVC() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: storeManager.store)
        
        viewController.maskImage = UIImage(named: "bloodDrop")
        viewController.smallMaskImage = UIImage(named: "bloodDrop")
        viewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        viewController.title = "Pet's Care Card"
        viewController.tabBarItem = UITabBarItem(title: "Pet's Card", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: 300, height: 100))
        button.setTitle("Cancel", forState: .Normal)
        button.addTarget(self, action: #selector(self.cancelBtn), forControlEvents: UIControlEvents.TouchUpInside)
        viewController.view.addSubview(button)
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Activity", style: .Plain, target: self, action: #selector(pushAddActivityController))
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.redColor()

        return viewController
    }
    
    func cancelBtn() {
        print("Btn")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - User interaction functions
    
    // Instantiates the AddActivityTableViewController from Main.storyboard
    // and asks navigationController to show it.
    func pushAddActivityController() {
        guard let addActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") else { return }
        
        self.presentViewController(addActivityTableVC, animated: true, completion: nil)
    }
}
