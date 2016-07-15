//
//  SymptomCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 15/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class SymptomCardViewController: UINavigationController {
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startDay = NSDateComponents(year: 2016, month: 3, day: 15)
        let onceADay = OCKCareSchedule.dailyScheduleWithStartDate(startDay, occurrencesPerDay: 1)
        let emotionalSurvey = OCKCarePlanActivity(
            identifier: "Emotional Survey",
            groupIdentifier: nil,
            type: .Assessment,
            title: "Daily Emotional Survey",
            text: "How are you feeling today?",
            tintColor: nil,
            instructions: nil,
            imageURL: nil,
            schedule: onceADay,
            resultResettable: false,
            userInfo: nil)
        
        storeManager.store.activityForIdentifier("Emotional Survey") { (success, activityOrNil, errorOrNil) -> Void in
            guard success else {
                // perform real error handling here.
                fatalError("*** An error occurred \(errorOrNil?.localizedDescription) ***")
            }
            
            if let activity = activityOrNil {
                
                print("The activity already exists.")
                
            } else {
                
                self.storeManager.store.addActivity(emotionalSurvey) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when adding a new Activity: \(error?.debugDescription)")
                    }
                }
                
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.pushViewController(createCareCardVC(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createCareCardVC() -> OCKSymptomTrackerViewController {
        let viewController = OCKSymptomTrackerViewController(carePlanStore: storeManager.store)
        
        viewController.showEdgeIndicators = true
        viewController.delegate = self
        
        // Setup controller's title and tab bar icon
        viewController.title = "Cuidados"
        viewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Activity", style: .Plain, target: self, action: #selector(pushAddActivityController))
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.redColor()
        
        return viewController
    }
    
    func pushAddActivityController() {
        guard let addActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") else { return }
        
        self.presentViewController(addActivityTableVC, animated: true, completion: nil)
    }
}

extension SymptomCardViewController: OCKSymptomTrackerViewControllerDelegate {
    func symptomTrackerViewController(viewController: OCKSymptomTrackerViewController, didSelectRowWithAssessmentEvent assessmentEvent: OCKCarePlanEvent) {
        if assessmentEvent.activity.identifier == "Emotional Survey" {
            print("Botão de dor no joelho clicado")
        }
    }
}
