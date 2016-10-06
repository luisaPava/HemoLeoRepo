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
    
    var activities: Array<Bool> = []
    var senderActivity: Int!
    var buttons: Array<UIButton> = []
    var selectedButton: UIButton!
    
    //MARK: - Managers
    let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
//    private let transitionManager = TransitionDelegate()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
//        self.transitioningDelegate = transitionManager
        
        //Set an array of buttons
        buttons += [vegetableBtn, fruitsBtn, waterBtn, exerciseBtn, fisiotherapyBtn, shotBtn]
        
        // Loads default Activities if it's the app's first launch
        let defaults = UserDefaults.standard
        
        if !defaults.bool(forKey: "loadedDefaultCareCardData") {
            loadDefaultActivities()
            defaults.set(true, forKey: "loadedDefaultCareCardData")
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
    
    @IBAction func doneBtn(sender: AnyObject) {
        self.dismiss(animated: false, completion: nil)
    }
}

//MARK: - Extension
extension AddActivityViewController {
    
    @IBAction func addActivityAction(sender: UIButton) {
        print(#function)
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
                self.storeManager.store.remove(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when removing the Activity: \(error.debugDescription)")
                    }
                }
                
                self.activities[key] = false
                sender.isSelected = false
                
                // Saves the 'added' activity to 'activities' coding and array.
                self.codingManager.saveToAddActivitiesData(activities: activities)
                
                // Removes the selected 'added' activity from its coding and array.
                self.codingManager.saveAddedActivitiesData(activities: activities)
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
                performSegue(withIdentifier: "activitiesToOccurencies", sender: self)
                
            case 4:
                senderActivity = 4
                performSegue(withIdentifier: "activitiesToOccurencies", sender: self)
                
            case 5:
                senderActivity = 5
                performSegue(withIdentifier: "activitiesToOccurencies", sender: self)
                
            default:
                break
            }
            
            if let activity = activity {
                self.storeManager.store.add(activity) { (success, error) in
                    if (error != nil) {
                        print("An error occurred when adding a new Activity: \(error.debugDescription)")
                    }
                }
                
                sender.isSelected = true
                self.activities[key] = true
                
                // Saves the 'to add' activity to 'addedActivities' coding and array.
                self.codingManager.saveAddedActivitiesData(activities: activities)
                
                // Removes the selected 'to add' activity from its coding and array.
                self.codingManager.saveToAddActivitiesData(activities: activities)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activitiesToOccurencies" {
            if let destinationVC = segue.destination as? OccurenciesViewController {
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
        
        codingManager.saveToAddActivitiesData(activities: activities)
    }
    
    //MARK: - Other methods
    func setButtons() {
        for i in 0..<activities.count {
            buttons[i].isSelected = activities[i]
        }
    }
}

