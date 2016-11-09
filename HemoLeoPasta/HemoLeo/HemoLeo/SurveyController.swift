//
//  SurveyController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 05/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class SurveyController: UIViewController {
    @IBOutlet weak var texxt: UITextField!
    var event: OCKCarePlanEvent! = nil
    var resultString = ""
    var resultArray: Array<String> = ["", "", "", "", ""]
    
    private var assessmentManager: AssessmentsManager? = nil
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
        
    }
    
    @IBAction func save(_ sender: Any) {
        let activityType = ActivityType(rawValue: event.activity.identifier)
        let assessment = assessmentManager!.activityWithType(type: activityType!)
        var result: OCKCarePlanEventResult!
        
        if self.countNonEmptyElements() == 1 {
            resultString = resultArray.first!
            
        } else {
            resultString = "\(self.countNonEmptyElements()) lugares"
            
        }
        
        result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: resultString)
        
        symptomTrackerModel.completeEvent(event: event, withResult: result!)
        
        self.dismiss(animated: false, completion: nil)
    }

    @IBAction func ombroAction(_ sender: UIButton) {
        if sender.isSelected == false {
            resultArray.insert(sender.accessibilityIdentifier!, at: sender.tag)
            sender.isSelected = true
            
        } else {
            resultArray[sender.tag] = sender.accessibilityIdentifier!
            sender.isSelected = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countNonEmptyElements() -> Int {
        var count: Int = 0
            
        for i in resultArray {
            if i != "" {
                count += 1
            }
        }
            
        return count
    }
}
