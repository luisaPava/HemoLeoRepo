//
//  SymptomTrackerModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class SymptomTrackerModel: NSObject {
    static let sharedSymptomTracker = SymptomTrackerModel()
    private let sharedCarePlanStore = CarePlanStoreManager.sharedCarePlanStoreManager
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private let assessmentManager: AssessmentsManager!
    
    private override init() {
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
    }
    
    func createSymtomTracker() -> OCKSymptomTrackerViewController {
        let symptomCardViewController = OCKSymptomTrackerViewController(carePlanStore: sharedCarePlanStore.store)
        
        symptomCardViewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        symptomCardViewController.title = "Cuidados"
        symptomCardViewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        symptomCardViewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        return symptomCardViewController
    }
    
    func shouldGoToSurvey(assessmentEvent: OCKCarePlanEvent) -> Bool {
        // Lookup the assessment the row represents.
        guard let activityType = ActivityType(rawValue: assessmentEvent.activity.identifier) else { return false }
        
        guard assessmentManager!.activityWithType(type: activityType) != nil else { return false }
        
        guard assessmentEvent.state == .initial ||
              assessmentEvent.state == .notCompleted ||
              (assessmentEvent.state == .completed && assessmentEvent.activity.resultResettable) else { return false }
        
        return true
    }
}

