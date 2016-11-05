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
    let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    var assessmentManager: AssessmentsManager? = nil
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
        self.delegate = self
        defaults.set(false, forKey: "isGameScene")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRect(x: -90, y: -50, width: 600, height: 700)
        self.view.autoresizesSubviews = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(true, forKey: "isGameScene")
    }
}

//MARK: - Task View Controller Delegate
extension SurveyViewController: ORKTaskViewControllerDelegate {
    // Called with then user completes a presented `ORKTaskViewController`.
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        defer {
            dismiss(animated: true, completion: nil)
        }
        
        // Make sure the reason the task controller finished is that it was completed.
        guard reason == .completed else { return }
        
        // Determine the event that was completed and the `SampleAssessment` it represents.
        guard let event = SymptomCardViewController.viewController.lastSelectedAssessmentEvent,
            let activityType = ActivityType(rawValue: event.activity.identifier),
            let sampleAssessment = assessmentManager!.activityWithType(type: activityType) else { return }
        
        // Build an `OCKCarePlanEventResult` that can be saved into the `OCKCarePlanStore`.
        let carePlanResult = sampleAssessment.buildResultForCarePlanEvent(event: event, taskResult: taskViewController.result)
        
        badgeSmartProgress(survey: event.activity.identifier)
        badgeSmartComplete()
        
        completeEvent(event: event, inStore: storeManager.store, withResult: carePlanResult)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, stepViewControllerWillAppear stepViewController: ORKStepViewController) {
        stepViewController.skipButtonTitle = "Pular"
        stepViewController.continueButtonTitle = "Próximo"
        defaults.set(false, forKey: "isGameScene")
        
    }
    
    // MARK: Convenience
    func completeEvent(event: OCKCarePlanEvent, inStore store: OCKCarePlanStore, withResult result: OCKCarePlanEventResult) {
        store.update(event, with: result, state: .completed) { success, _, error in
            if !success {
                print(error?.localizedDescription)
            }
        }
    }
    
    //Set an array that tracks the completion of the Smart Badge
    private func badgeSmartProgress(survey: String) {
        if !defaults.bool(forKey: "badgeSmart") {
            var array = defaults.object(forKey: "badgeSmartArray") as? [String] ?? []
            
            if array.isEmpty {
                defaults.set([survey], forKey: "badgeSmartArray")
                
            } else {
                if array.contains(survey) {
                    return
                    
                } else {
                    array += [survey]
                    defaults.set(array, forKey: "badgeSmartArray")
                }
            }
        }
    }
    
    //If the badge is complete set true in the user default
    private func badgeSmartComplete() {
        if defaults.bool(forKey: "badgeSmart") {
            return
            
        } else {
            let array = defaults.object(forKey: "badgeSmartArray") as! [String]
            
            if array.count == 3 {
                defaults.set(true, forKey: "badgeSmart")
                print("badge complete")
            }
        }
    }
}
