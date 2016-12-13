//
//  MotivoEmergenciaViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 02/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

//#if IPAD
//    let main = UIViewController() as! MainViewController
//#else
//    let main = ""
//#endif

class MotivoEmergenciaViewController: UIViewController {
    @IBOutlet weak var labelMotivo: UILabel!
    @IBOutlet weak var textViewMotivo: UITextView!
    @IBOutlet weak var salvarBtn: CustomView!
    
    var event: OCKCarePlanEvent! = nil
    var activityType: ActivityType!
    var main: MainViewController! = nil
    
    fileprivate var moveValue: CGFloat = 0
    fileprivate let calendarDAO = DAOCalendario.sharedDAOCalendario
    private var assessmentManager: AssessmentsManager? = nil
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textViewMotivo.layer.cornerRadius = 20
        textViewMotivo.layer.borderWidth = 1
        textViewMotivo.layer.borderColor = UIColor(netHex: 0x2DC66D).cgColor
        textViewMotivo.delegate = self
        
        print(device)
        
        if device.contains("iPad") {
            moveValue = 320
            
        } else {
            moveValue = 100
        }
        
//        moveValue = 320
        
        labelMotivo.alpha = 0
        textViewMotivo.alpha = 0
        
        labelMotivo.lineBreakMode = .byWordWrapping
        labelMotivo.numberOfLines = 0
        
        assessmentManager = symptomTrackerModel.getAssessmentManager()
        activityType = ActivityType(rawValue: event.activity.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hadEmergency(_ sender: UIButton) {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: sender)
        
        let flag = sender.isSelected
        
        if flag {
            labelMotivo.runAnimation(UIAnimation.fadeAlphaTo(0, duration: 0.5))
            textViewMotivo.runAnimation(UIAnimation.fadeAlphaTo(0, duration: 0.5))
            salvarBtn.isSelected = false
            
            sender.isSelected = false
            
        } else {
            labelMotivo.runAnimation(UIAnimation.fadeAlphaTo(1, duration: 0.5))
            textViewMotivo.runAnimation(UIAnimation.fadeAlphaTo(1, duration: 0.5))
            salvarBtn.isSelected = true
            
            sender.isSelected = true

        }
    }
    
    @IBAction func salvarAction(_ sender: UIButton) {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: sender)
        
        if sender.isSelected {
            if !textViewMotivo.text.isEmpty {
                calendarDAO.append(newEvent: textViewMotivo.text, withType: .Emergencial)
                let assessment = assessmentManager!.activityWithType(type: activityType!)
                let result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: textViewMotivo.text)
                symptomTrackerModel.completeEvent(event: event, withResult: result!)
                
            } else {
                mensagem(titulo: "Atenção", desc: "Escreva o motivo da aplicação", view: self)
                
            }
        } else {
            let assessment = assessmentManager!.activityWithType(type: activityType!)
            let result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: "Sem emergência")
            symptomTrackerModel.completeEvent(event: event, withResult: result!)
        }
        
        let _ = navigationController?.popViewController(animated: true)
    }
}

extension MotivoEmergenciaViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        animateViewMoving(true, moveValue: moveValue)
        
        if device.contains("iPad") && main != nil {
            main.animateViewMoving(true, moveValue: moveValue)
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        animateViewMoving(false, moveValue: moveValue)
        
        if device.contains("iPad") && main != nil {
            main.animateViewMoving(false, moveValue: moveValue)
        }
    }
    
    func animateViewMoving(_ up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
