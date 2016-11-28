//
//  CareCardModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class CareCardModel: Observer {
    static let sharedCareCardModel = CareCardModel()
    private var sharedCarePlanStoreManager: CarePlanStoreManager!
    private var leo: Leo!
    private let defaults = UserDefaults.standard
    private var activities: Array<Bool> = []
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    
    private override init() {
        super.init()
        
        self.subject = Subject.sharedSubject
        self.subject.attach(self)
        
        self.leo = self.subject.getLeo()
        self.sharedCarePlanStoreManager = CarePlanStoreManager(path: leo.getId())
    }
    
    // Update the user
    override func update() {
        self.leo = self.subject.getLeo()
        self.sharedCarePlanStoreManager = CarePlanStoreManager(path: leo.getId())
    }
    
    func createCareCard() -> OCKCareCardViewController {
        let careCardViewController = OCKCareCardViewController(carePlanStore: sharedCarePlanStoreManager.store)
        
        careCardViewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        careCardViewController.title = "Cuidados"
        careCardViewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
//        careCardViewController.navigationItem.rightBarButtonItem?.title = "Logout"
        
        
        return careCardViewController
    }
    
    // Remove the activity
    func removeActivity(withKey key: Int) {
        let activity = self.getActivity(withKey: key)
        
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
    func addActivity(withKey key: Int, occurencies: [Int]?) {
        let activity = self.getActivity(withKey: key, occurencies: occurencies)
        
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
    
    private func getActivity(withKey key: Int, occurencies: [Int]?) -> OCKCarePlanActivity? {
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
            
        case 6:
            activity = Emergencial().carePlanActivityCustom(customOccurencies: occurencies!)
            
        default:
            break
        }
        
        return activity
        
    }
    
    private func getActivity(withKey key: Int) -> OCKCarePlanActivity? {
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
            
        case 6:
            activity = Emergencial().carePlanActivity()
            
        default:
            break
        }
        
        return activity
        
    }
    
    // Check if it's the first launch and load the activities
    func loadActivities() {
        if !defaults.bool(forKey: "\(leo.getId())/loadedDefaultCareCardData") {
            loadDefaultActivities()
            defaults.set(true, forKey: "\(leo.getId())/loadedDefaultCareCardData")
            
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
    
    func getLeo() -> Leo {
        return self.leo
    }
    
    func getActivityID(withKey key: Int) -> String {
        return (getActivity(withKey: key)?.identifier)!
    }
}

//extension CareCardModel: OCKCareCardViewControllerDelegate {
//    func careCardViewController(_ viewController: OCKCareCardViewController, didSelectButtonWithInterventionEvent interventionEvent: OCKCarePlanEvent) {
//        print("teste")
//    }
//}
