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
    @IBOutlet weak var semSintomasBtn: CustomView!
    
    var event: OCKCarePlanEvent! = nil
    
    fileprivate var resultString = ""
    fileprivate var resultArray: Array<String>! = []
    fileprivate var index = 0
    fileprivate var sliderValue: Int = 0
    fileprivate var activityType: ActivityType!
    fileprivate var numBtn: Int!
    
    @IBOutlet weak var viewMenino: MeninoDorView!
    @IBOutlet weak var viewMeninoSangramento: MeninoSangramentoView!
    @IBOutlet weak var viewMeninoHematoma: MeninoHematomasView!
    
    private var assessmentManager: AssessmentsManager? = nil
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker
    private let calendarDAO = DAOCalendario.sharedDAOCalendario

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
        activityType = ActivityType(rawValue: event.activity.identifier)
        
        viewMenino.meninoDorViewDelegate = self
        viewMeninoHematoma.meninoHematomasViewDelegate = self
        viewMeninoSangramento.meninoSangramentoViewDelegate = self
        
        setNumBtn()
        
//        print("\(width) - \(height)")
    }
    
    func setNumBtn() {
        switch activityType.rawValue {
            case "Dor":
                numBtn = 10
                viewMenino.isHidden = false
            
            case "Sangramento":
                numBtn = 8
                viewMeninoSangramento.isHidden = false
            
            case "Hematoma":
                numBtn = 14
                viewMeninoHematoma.isHidden = false
            
            default:
                break
        }
        
        for _ in 0..<numBtn {
            resultArray.append("")
        }
    }
    
    @IBAction func semSintomasAction(_ sender: UIButton) {
        let assessment = assessmentManager!.activityWithType(type: activityType!)
        var result: OCKCarePlanEventResult!
        
        result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: "Sem Sintomas")
        symptomTrackerModel.completeEvent(event: event, withResult: result!)
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func saveResult(level: Int, local: String) {
        let assessment = assessmentManager!.activityWithType(type: activityType!)
        var result: OCKCarePlanEventResult!
        
        if self.countNonEmptyElements() == 1 {
            resultString = resultArray[index].getFirstWordAndLetter()
            
        } else {
            resultString = "\(self.countNonEmptyElements()) lugares"
            
        }
        
        result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: resultString)
        symptomTrackerModel.completeEvent(event: event, withResult: result!)
        
        let newEventString = "\(local) - \(level)"
        let type = EventType(rawValue: activityType.rawValue)!
        calendarDAO.append(newEvent: newEventString, withType: type)
        
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

extension SurveyController: MeninoDorViewDelegate, MeninoHematomasViewDelegate, MeninoSangramentoViewDelegate {
    func botãoDesativado(botãoDesativado: UIButton) {
        if botãoDesativado.isSelected == false {
            resultArray[botãoDesativado.tag] = botãoDesativado.accessibilityIdentifier!
            botãoDesativado.isSelected = true
            
            let popup = PopupController.create(self)
            
            let container = PopUpViewController.instance()
            container.closeHandler = { _ in
                self.sliderValue = Int(PopUpViewController.sliderValue)

                popup.dismiss()
                self.saveResult(level: self.sliderValue, local: botãoDesativado.accessibilityIdentifier!)
                self.semSintomasBtn.isEnabled = false
            }
            
            let _ = popup.show(container)
            
        } else {
            resultArray[botãoDesativado.tag] = ""
            botãoDesativado.isSelected = false
        }
    }
}
