//
//  OccurenciesViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/19/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class OccurenciesViewController: UIViewController {
    
    var activity: Int!
    
    var activities: Array<Bool> = []
    
    var instanceOfActivity: OCKCarePlanActivity!
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager



    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    
        
        activities = codingManager.loadToAddActivitiesData()!

        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 7
        
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

    @IBAction func valueChanged(sender: AnyObject) {
        
        valueLabel.text = Int(stepper.value).description
        
    }
    
    @IBAction func save(sender: AnyObject) {
        
        let st = Int(stepper.value)
        
        switch activity {
        case 3:
            instanceOfActivity = Exercise().carePlanActivityCustom([st, st, st, st, st, st, st])
            
        case 4:
            instanceOfActivity = Fisiotherapy().carePlanActivityCustom([st, st, st, st, st, st, st])
            
        case 5:
            instanceOfActivity = Shot().carePlanActivityCustom([st, st, st, st, st, st, st])
        default:
            break
        }
        
        if let activity = activity {
            self.storeManager.store.addActivity(instanceOfActivity) { (success, error) in
                if (error != nil) {
                    print("An error occurred when adding a new Activity: \(error?.debugDescription)")
                }
            }
            
            self.activities[activity] = true

            
            // Saves the 'to add' activity to 'addedActivities' coding and array.
            self.codingManager.saveAddedActivitiesData(activities)
            
            // Removes the selected 'to add' activity from its coding and array.
            self.codingManager.saveToAddActivitiesData(activities)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
