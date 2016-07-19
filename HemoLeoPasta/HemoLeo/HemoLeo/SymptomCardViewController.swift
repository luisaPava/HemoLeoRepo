//
//  SymptomCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 15/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit
import ResearchKit

class SymptomCardViewController: UINavigationController {
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private var assessmentManager: AssessmentsManager? = nil
    private var viewController: OCKSymptomTrackerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
    }
    
    override func viewWillAppear(animated: Bool) {
        viewController = createCareCardVC()
        self.pushViewController(viewController, animated: false)
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
        
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.redColor()
        
        return viewController
    }
    
    func pushAddActivityController() {
        guard let addActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddActivityVC") else { return }
        
        self.presentViewController(addActivityTableVC, animated: true, completion: nil)
    }
}

//MARK: - SymptomTracker Delegate
extension SymptomCardViewController: OCKSymptomTrackerViewControllerDelegate {
    func symptomTrackerViewController(viewController: OCKSymptomTrackerViewController, didSelectRowWithAssessmentEvent assessmentEvent: OCKCarePlanEvent) {
        
        // Lookup the assessment the row represents.
        guard let activityType = ActivityType(rawValue: assessmentEvent.activity.identifier) else { return }
        guard let sampleAssessment = assessmentManager!.activityWithType(activityType) else { return }
    
        guard assessmentEvent.state == .Initial ||
            assessmentEvent.state == .NotCompleted ||
            (assessmentEvent.state == .Completed && assessmentEvent.activity.resultResettable) else { return }
        
        // Show an `ORKTaskViewController` for the assessment's task.
        let taskViewController = ORKTaskViewController(task: sampleAssessment.task(), taskRunUUID: nil)
        taskViewController.delegate = self
        
        pushViewController(taskViewController, animated: true)
    }
}

extension SymptomCardViewController: ORKTaskViewControllerDelegate {
    // Called with then user completes a presented `ORKTaskViewController`.
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        defer {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        // Make sure the reason the task controller finished is that it was completed.
        guard reason == .Completed else { return }
        
        // Determine the event that was completed and the `SampleAssessment` it represents.
        guard let event = viewController.lastSelectedAssessmentEvent,
            activityType = ActivityType(rawValue: event.activity.identifier),
            sampleAssessment = assessmentManager!.activityWithType(activityType) else { return }
        
        // Build an `OCKCarePlanEventResult` that can be saved into the `OCKCarePlanStore`.
        let carePlanResult = sampleAssessment.buildResultForCarePlanEvent(event, taskResult: taskViewController.result)
        
        completeEvent(event, inStore: storeManager.store, withResult: carePlanResult)
    }
    
    // MARK: Convenience
    
    private func completeEvent(event: OCKCarePlanEvent, inStore store: OCKCarePlanStore, withResult result: OCKCarePlanEventResult) {
        store.updateEvent(event, withResult: result, state: .Completed) { success, _, error in
            if !success {
                print(error?.localizedDescription)
            }
        }
    }
}
