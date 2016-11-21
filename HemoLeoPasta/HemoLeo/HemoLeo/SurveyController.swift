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
    var esqArray: Array<UIButton> = []
    var dirArray: Array<UIButton> = []
    var activityType: ActivityType!
    
    @IBOutlet weak var viewMenino: MeninoDorView!
    
//    var viewMenino: UIView!
//    var viewMeninoSangue: MeninoSangramentoView
    
    
    private var assessmentManager: AssessmentsManager? = nil
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
        activityType = ActivityType(rawValue: event.activity.identifier)
        
        viewMenino.meninoDorViewDelegate = self
        
//        print("\(width) - \(height)")
        
        
        
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
    
//    func chooseViewClass() {
//        if activityType == .Pain {
//            viewMenino = MeninoDorView(frame: CGRect(x: 0, y: 150, width: width, height: height / 0.7))
//            viewMenino.meninoDorViewDelegate = self
//        } else {
//            
//        }
//    }
    
    func saveResult() {
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

    @IBAction func segmentedControlAction(_ sender: ADVSegmentedControl) {
        let index = sender.selectedIndex
        
        if index == 0 {
            viewMenino.addSwitchMaskToRightAnimation()
            
        } else {
            viewMenino.addSwitchMaskToLeftAnimation()
            
        }
        
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
    
    func setArrayBtn(_ array: Array<UIButton>, bool: Bool) {
        for btn in array {
            btn.isEnabled = bool
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

extension SurveyController: MeninoDorViewDelegate {
    func botãoDesativadoDor(botãoDesativado: UIButton) {
        if botãoDesativado.isSelected == false {
            resultArray[botãoDesativado.tag] = botãoDesativado.accessibilityIdentifier!
            botãoDesativado.isSelected = true
            
        } else {
            resultArray[botãoDesativado.tag] = ""
            botãoDesativado.isSelected = false
        }
    }
}
