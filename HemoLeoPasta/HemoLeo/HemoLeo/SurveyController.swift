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
    let storeManager = CarePlanStoreManager.sharedCarePlanStoreManager
    var assessmentManager: AssessmentsManager? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
        
    }
    
    @IBAction func save(_ sender: Any) {
        let activityType = ActivityType(rawValue: event.activity.identifier)
        let assessment = assessmentManager!.activityWithType(type: activityType!)
        let result = assessment?.buildResultForCarePlanEvent(event: event, taskResult: texxt.text!)
        
        completeEvent(event: event, inStore: storeManager.store, withResult: result!)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    // Storyboard não funciona direito não é minha culpa :(

    
    
    
    func completeEvent(event: OCKCarePlanEvent, inStore store: OCKCarePlanStore, withResult result: OCKCarePlanEventResult) {
        store.update(event, with: result, state: .completed) { success, _, error in
            if !success {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
