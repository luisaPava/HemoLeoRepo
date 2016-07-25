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
    @IBOutlet weak var vegetableBtn: UIButton!
    @IBOutlet weak var fruitsBtn: UIButton!
    @IBOutlet weak var waterBtn: UIButton!
    @IBOutlet weak var exerciseBtn: UIButton!
    @IBOutlet weak var fisiotherapyBtn: UIButton!
    @IBOutlet weak var shotBtn: UIButton!
    
    private var activities: Array<Bool> = []
    private var senderActivity: Int!
    private var buttons: Array<UIButton> = []
    private var selectedButton: UIButton!
    
    //MARK: - Managers
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let transitionManager = TransitionDelegate()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.translucent = false
        
        self.transitioningDelegate = transitionManager
        
        //Set an array of buttons
        buttons += [vegetableBtn, fruitsBtn, waterBtn, exerciseBtn, fisiotherapyBtn, shotBtn]
        
        // Loads default Activities if it's the app's first launch
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if !defaults.boolForKey("loadedDefaultCareCardData") {
            print("Loading default Activities...")
            loadDefaultActivities()
            defaults.setBool(true, forKey: "loadedDefaultCareCardData")
        } else {
            self.activities = codingManager.loadToAddActivitiesData()!
        }
        
        //Set the buttons state
        setButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue) {
//        // bug? exit segue doesn't dismiss so we do it manually...
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
}

//MARK: - Extension
extension AddActivityViewController {
    
    @IBAction func addActivityAction(sender: UIButton) {
        let key = sender.tag
        var activity: OCKCarePlanActivity? = nil
        selectedButton = sender
        
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
                
            default:
                break
            }
            
            if let activity = activity {
                self.storeManager.store.removeActivity(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when removing the Activity: \(error?.debugDescription)")
                    }
                }
                
                self.activities[key] = false
                sender.selected = false
                
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
                
            default:
                break
            }
            
            if let activity = activity {
                self.storeManager.store.addActivity(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when adding a new Activity: \(error?.debugDescription)")
                    }
                }
                
                sender.selected = true
                self.activities[key] = true
                
                // Saves the 'to add' activity to 'addedActivities' coding and array.
                self.codingManager.saveAddedActivitiesData(activities)
                
                // Removes the selected 'to add' activity from its coding and array.
                self.codingManager.saveToAddActivitiesData(activities)
            }
        }
        
        
        print(selectedButton)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "activitiesToOccurencies" {
            if let destinationVC = segue.destinationViewController as? OccurenciesViewController {
                destinationVC.activity = senderActivity
                destinationVC.button = selectedButton
                
            }
        }
    }
    
    // MARK: - NSCoding
    func loadDefaultActivities() {
        let activitiesToLoad = 6
        
        for _ in 0..<activitiesToLoad {
            self.activities.append(false)
        }
        
        codingManager.saveToAddActivitiesData(activities)
    }
    
    //MARK: - Other methods
    func setButtons() {
        for i in 0..<activities.count {
            buttons[i].selected = activities[i]
        }
    }
}

