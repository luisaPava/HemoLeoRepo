//
//  CareCardModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class CareCardModel: NSObject {
    static let sharedCareCardModel = CareCardModel()
    private let sharedCarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private let defaults = UserDefaults.standard
    private var activities: Array<Bool> = []
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    
    private override init() { }
    
    func createCareCard() -> OCKCareCardViewController {
        let careCardViewController = OCKCareCardViewController(carePlanStore: sharedCarePlanStoreManager.store)
        
        careCardViewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        careCardViewController.title = "Cuidados"
        careCardViewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        careCardViewController.navigationItem.rightBarButtonItem?.title = "Hoje"
        careCardViewController.delegate = self
        careCardViewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        return careCardViewController
    }
    
    // Remove the activity
    func removeActivity(_ key: Int) {
        let activity = self.getActivityWithKey(key)
        
        if activity != nil {
            self.sharedCarePlanStoreManager.store.remove(activity!) { (success, error) in
                if (error != nil) {
                    print("An error occurred when removing the Activity: \(error.debugDescription)")
                }
            }
            
            self.activities[key] = false
            
            // Saves the 'added' activity to 'activities' coding and array.
            self.codingManager.saveToAddActivitiesData(activities: activities)
            
            // Removes the selected 'added' activity from its coding and array.
            self.codingManager.saveAddedActivitiesData(activities: activities)
        }
        
    }
    
    // Add the activity
    func addActivity(_ key: Int, _ occurencies: [Int]?) {
        let activity = self.getActivityWithKey(key, occurencies)
        
        if activity != nil {
            self.sharedCarePlanStoreManager.store.add(activity!) { (success, error) in
                if (error != nil) {
                    print("An error occurred when adding a new Activity: \(error.debugDescription)")
                }
            }
            
            self.activities[key] = true
            
            // Saves the 'to add' activity to 'addedActivities' coding and array.
            self.codingManager.saveAddedActivitiesData(activities: activities)
            
            // Removes the selected 'to add' activity from its coding and array.
            self.codingManager.saveToAddActivitiesData(activities: activities)
        }
    }
    
    func getActivityWithKey(_ key: Int, _ occurencies: [Int]?) -> OCKCarePlanActivity? {
        var activity: OCKCarePlanActivity? = nil
        
        switch key {
        case 0:
            activity = Vegetables().carePlanActivity()
            
        case 1:
            activity = Fruits().carePlanActivity()
            
        case 2:
            activity = Water().carePlanActivity()
            
        case 3:
            activity = Exercise().carePlanActivityCustom(customOccurencies: occurencies!)
            
        case 4:
            activity = Fisiotherapy().carePlanActivityCustom(customOccurencies: occurencies!)
            
        case 5:
            activity = Shot().carePlanActivityCustom(customOccurencies: occurencies!)
            
        default:
            break
        }
        
        return activity
        
    }
    
    func getActivityWithKey(_ key: Int) -> OCKCarePlanActivity? {
        var activity: OCKCarePlanActivity? = nil
        
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
        
        return activity
        
    }
    
    // Check if it's the first launch and load the activities
    func loadActivities() {
        if !defaults.bool(forKey: "loadedDefaultCareCardData") {
            loadDefaultActivities()
            defaults.set(true, forKey: "loadedDefaultCareCardData")
            
        } else {
            self.activities = codingManager.loadToAddActivitiesData()!
        }
    }
    
    // Loads default Activities if it's the app's first launch
    private func loadDefaultActivities() {
        let activitiesToLoad = 6
        
        for _ in 0..<activitiesToLoad {
            self.activities.append(false)
        }
        
        codingManager.saveToAddActivitiesData(activities: activities)
    }
    
    func getActivities() -> Array<Bool> {
        return activities
    }
    
    func saveOccurencies(occurencies: Array<Int>) {
        
    }
}

extension CareCardModel: OCKCareCardViewControllerDelegate {
    func careCardViewController(_ viewController: OCKCareCardViewController, didSelectButtonWithInterventionEvent interventionEvent: OCKCarePlanEvent) {
        print("teste")
    }
}