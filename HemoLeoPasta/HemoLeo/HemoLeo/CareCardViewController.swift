//
//  CareCardViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class CareCardViewController: OCKCareCardViewController {
    

    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addTylenolActivity()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func addTylenolActivity() {
        var tylenolActivity : OCKCarePlanActivity!
        
        let startdate = NSDateComponents(year: 2016, month: 01, day: 01)
        
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startdate, occurrencesOnEachDay: [1,0,2,0,2,0,1])
        
        tylenolActivity = OCKCarePlanActivity.interventionWithIdentifier("tylenol", groupIdentifier: "medicamentos", title: "Tylenol", text: "750mg", tintColor: UIColor.blueColor(), instructions: "bla bla bla", imageURL: nil, schedule: schedule, userInfo: nil)
        
        storeManager.store.addActivity(tylenolActivity) { (success, error) in
            if error != nil {
                print("Erro ao adicionar atividade do tylenol")
            }
        }
        
    }


}
