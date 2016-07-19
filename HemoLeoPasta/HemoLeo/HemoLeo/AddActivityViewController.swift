//
//  AddActivityViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class AddActivityViewController: UIViewController {
    
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    
    private var activities: Array<Bool> = []
    
    private var senderActivity: Int!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.translucent = false
        
        // Loads default Activities if it's the app's first launch
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if !defaults.boolForKey("loadedDefaultCareCardData") {
            print("Loading default Activities...")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "firstLaunch")
            loadDefaultActivities()
            defaults.setBool(true, forKey: "loadedDefaultCareCardData")
        } else {
            self.activities = codingManager.loadToAddActivitiesData()!
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBarButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension AddActivityViewController {
    
    @IBAction func addActivityAction(sender: AnyObject) {
//        let button = sender as! UIButton
        let key = sender.tag!
        var activity: OCKCarePlanActivity? = nil
        
        if (activities[key] == true) {
            switch key {
            case 0:
                activity = Vegetables().carePlanActivity()
                
            case 1:
                activity = Fruits().carePlanActivity()
                
            case 2:
                activity = Water().carePlanActivity()
                
            case 3:
                activity = Exercise().carePlanActivity()
                
            case 4:
                activity = Fisiotherapy().carePlanActivity()
                
            case 5:
                activity = Shot().carePlanActivity()
                
            case 6:
                activity = nil
                
                guard let addCustomActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddCustomActivityVC") else { return }
                self.presentViewController(addCustomActivityTableVC, animated: true, completion: nil)
                
            default:
                break
            }
            
            if let activity = activity {
                self.storeManager.store.removeActivity(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when removing the Activity: \(error?.debugDescription)")
                    }
                }
                
//                sender.tintColor = UIColor.redColor()
                
                self.activities[key] = false
                
                // Saves the 'added' activity to 'activities' coding and array.
                self.codingManager.saveToAddActivitiesData(activities)
                
                // Removes the selected 'added' activity from its coding and array.
                self.codingManager.saveAddedActivitiesData(activities)
            }
            
        } else {
            switch key {
            case 0:
                activity = Vegetables().carePlanActivity()
                
            case 1:
                activity = Fruits().carePlanActivity()
                
            case 2:
                activity = Water().carePlanActivity()
                
            case 3:
                senderActivity = 3
                performSegueWithIdentifier("activitiesToOccurencies", sender: self)
                
            case 4:
                senderActivity = 4
                performSegueWithIdentifier("activitiesToOccurencies", sender: self)
                
            case 5:
                senderActivity = 5
                performSegueWithIdentifier("activitiesToOccurencies", sender: self)
                
            case 6:
                activity = nil
                
                guard let addCustomActivityTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddCustomActivityVC") else { return }
                self.presentViewController(addCustomActivityTableVC, animated: true, completion: nil)
                
            default:
                break
            }
            
            if let activity = activity {
                self.storeManager.store.addActivity(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when adding a new Activity: \(error?.debugDescription)")
                    }
                }
                
                self.activities[key] = true
                
                // Saves the 'to add' activity to 'addedActivities' coding and array.
                self.codingManager.saveAddedActivitiesData(activities)
                
                // Removes the selected 'to add' activity from its coding and array.
                self.codingManager.saveToAddActivitiesData(activities)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            
        if segue.identifier == "activitiesToOccurencies" {
            
            if let destinationVC = segue.destinationViewController as? OccurenciesViewController {
            
                destinationVC.activity = senderActivity
                
            }
                
        }

        
    }
    
    
    // MARK: NSCoding

    
    func loadDefaultActivities() {
        let activitiesToLoad = 7
        
        for _ in 0..<activitiesToLoad {
            self.activities.append(false)
        }
        
        codingManager.saveToAddActivitiesData(activities)
    }
    
}

