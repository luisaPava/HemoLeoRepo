//
//  SymptomCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 15/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit
//import ResearchKit

class SymptomCardViewController: UINavigationController {
    var assessmentManager: AssessmentsManager? = nil
    let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker
    var viewController: OCKSymptomTrackerViewController!
    var event: OCKCarePlanEvent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewController = symptomTrackerModel.createSymtomTracker()
        viewController.delegate = self
        self.pushViewController(viewController, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "symptomToSurvey2" {
            let vc = segue.destination as! SurveyController
            vc.event = self.event
        }
    }
}

//MARK: - SymptomTracker Delegate
extension SymptomCardViewController: OCKSymptomTrackerViewControllerDelegate {
    func symptomTrackerViewController(_ viewController: OCKSymptomTrackerViewController, didSelectRowWithAssessmentEvent assessmentEvent: OCKCarePlanEvent) {
        
        if symptomTrackerModel.shouldGoToSurvey(assessmentEvent: assessmentEvent) {
            self.event = assessmentEvent
            
            //Show an `ORKTaskViewController` for the assessment's task.
            let taskViewController = self.storyboard?.instantiateViewController(withIdentifier: "survey") as! SurveyController
            taskViewController.popoverPresentationController?.delegate = self
            
            performSegue(withIdentifier: "symptomToSurvey2", sender: self)
            
        }
    }
}

//MARK: - UIPopoverPresentationControllerDelegate
extension SymptomCardViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
