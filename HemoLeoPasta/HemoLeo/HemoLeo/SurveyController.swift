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
    var index = 0
    var sliderValue = 0
    
    private var assessmentManager: AssessmentsManager? = nil
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
        
    }
    
    @IBAction func save(_ sender: UIButton) {
        let popup = PopupController.create(self)
        
        let container = PopUpViewController.instance()
        container.closeHandler = { _ in
            self.sliderValue = PopUpViewController.sliderValue
            print(self.sliderValue)
            popup.dismiss()
            self.saveResult()
        }
        
        let _ = popup.show(container)
    }
    
    func saveResult() {
        let activityType = ActivityType(rawValue: event.activity.identifier)
        let assessment = assessmentManager!.activityWithType(type: activityType!)
        var result: OCKCarePlanEventResult!
        
        if self.countNonEmptyElements() == 1 {
            resultString = resultArray[index]
            
        } else {
            resultString = "\(self.countNonEmptyElements()) lugares"
            
        }
        
        result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: resultString)
        
        symptomTrackerModel.completeEvent(event: event, withResult: result!)
        
        self.dismiss(animated: false, completion: nil)
        
    }

    @IBAction func ombroAction(_ sender: UIButton) {
        if sender.isSelected == false {
            resultArray[sender.tag] = sender.accessibilityIdentifier!
            sender.isSelected = true
            
        } else {
            resultArray[sender.tag] = ""
            sender.isSelected = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countNonEmptyElements() -> Int {
        var count: Int = 0
        var j = 0
            
        for i in resultArray {
            if i != "" {
                count += 1
                index = j
                
            } else {
                j += 1
                
            }
        }
            
        return count
    }
}
