//
//  SurveyViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 20/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import ResearchKit
import CareKit

class SurveyViewController: ORKTaskViewController {
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private var assessmentManager: AssessmentsManager? = nil
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
        self.delegate = self
        defaults.setBool(false, forKey: "isGameScene")

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(animated: Bool) {
//        defaults.setBool(false, forKey: "isGameScene")
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(-90, -50, 600, 700)
        self.view.autoresizesSubviews = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setBool(true, forKey: "isGameScene")
    }
}

//MARK: - Task View Controller Delegate
extension SurveyViewController: ORKTaskViewControllerDelegate {
    // Called with then user completes a presented `ORKTaskViewController`.
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        defer {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        // Make sure the reason the task controller finished is that it was completed.
        guard reason == .Completed else { return }
        
        // Determine the event that was completed and the `SampleAssessment` it represents.
        guard let event = SymptomCardViewController.viewController.lastSelectedAssessmentEvent,
            activityType = ActivityType(rawValue: event.activity.identifier),
            sampleAssessment = assessmentManager!.activityWithType(activityType) else { return }
        
        // Build an `OCKCarePlanEventResult` that can be saved into the `OCKCarePlanStore`.
        let carePlanResult = sampleAssessment.buildResultForCarePlanEvent(event, taskResult: taskViewController.result)
        
        badgeSmartProgress(event.activity.identifier)
        badgeSmartComplete()
        
        completeEvent(event, inStore: storeManager.store, withResult: carePlanResult)
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
        stepViewController.skipButtonTitle = "Pular"
        stepViewController.continueButtonTitle = "Próximo"
        defaults.setBool(false, forKey: "isGameScene")
        
    }
    
    // MARK: Convenience
    func completeEvent(event: OCKCarePlanEvent, inStore store: OCKCarePlanStore, withResult result: OCKCarePlanEventResult) {
        store.updateEvent(event, withResult: result, state: .Completed) { success, _, error in
            if !success {
                print(error?.localizedDescription)
            }
        }
    }
    
    //Set an array that tracks the completion of the Smart Badge
    private func badgeSmartProgress(survey: String) {
        if !defaults.boolForKey("badgeSmart") {
            var array = defaults.objectForKey("badgeSmartArray") as? [String] ?? []
            
            if array.isEmpty {
                defaults.setObject([survey], forKey: "badgeSmartArray")
                
            } else {
                if array.contains(survey) {
                    return
                    
                } else {
                    array += [survey]
                    defaults.setObject(array, forKey: "badgeSmartArray")
                }
            }
        }
    }
    
    //If the badge is complete set true in the user default
    private func badgeSmartComplete() {
        if defaults.boolForKey("badgeSmart") {
            return
            
        } else {
            let array = defaults.objectForKey("badgeSmartArray") as! [String]
            
            if array.count == 3 {
                defaults.setBool(true, forKey: "badgeSmart")
                print("badge complete")
            }
        }
    }
}
