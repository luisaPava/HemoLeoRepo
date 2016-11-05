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
    let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    var assessmentManager: AssessmentsManager? = nil
    static var viewController: OCKSymptomTrackerViewController!
    var task: ORKTask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        SymptomCardViewController.viewController = createCareCardVC()
        self.pushViewController(SymptomCardViewController.viewController, animated: false)
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
        
        viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        return viewController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "symptomToSurvey" {
//            let vc = segue.destination as! SurveyViewController
//            vc.task = task
        }
    }
}

//MARK: - SymptomTracker Delegate
extension SymptomCardViewController: OCKSymptomTrackerViewControllerDelegate {
    func symptomTrackerViewController(_ viewController: OCKSymptomTrackerViewController, didSelectRowWithAssessmentEvent assessmentEvent: OCKCarePlanEvent) {
        
        // Lookup the assessment the row represents.
        guard let activityType = ActivityType(rawValue: assessmentEvent.activity.identifier) else { return }
        guard assessmentManager!.activityWithType(type: activityType) != nil else { return }
    
        guard assessmentEvent.state == .initial ||
              assessmentEvent.state == .notCompleted ||
              (assessmentEvent.state == .completed && assessmentEvent.activity.resultResettable) else { return }
        
        //Show an `ORKTaskViewController` for the assessment's task.
        let taskViewController = self.storyboard?.instantiateViewController(withIdentifier: "survey") as! SurveyViewController
        
//        task = sampleAssessment.task()
        taskViewController.popoverPresentationController?.delegate = self
        
        performSegue(withIdentifier: "symptomToSurvey2", sender: self)
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension SymptomCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
