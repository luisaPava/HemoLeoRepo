//
//  SymptomTrackerModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class SymptomTrackerModel: Observer {
    static let sharedSymptomTracker = SymptomTrackerModel()
    private var storeManager: CarePlanStoreManager!
    private var leo: Leo!
    private var assessmentManager: AssessmentsManager!
    
    private override init() {
        super.init()
        
        self.subject = Subject.sharedSubject
        self.subject.attach(self)
        self.leo = self.subject.getLeo()
        
        storeManager = CarePlanStoreManager(path: leo.getId())
        assessmentManager = AssessmentsManager(carePlanStore: storeManager.store)
    }
    
    // Update the user
    override func update() {
        self.leo = self.subject.getLeo()
        self.storeManager = CarePlanStoreManager(path: leo.getId())
    }
    
    func createSymtomTracker() -> OCKSymptomTrackerViewController {
        let symptomCardViewController = OCKSymptomTrackerViewController(carePlanStore: storeManager.store)
        
        symptomCardViewController.showEdgeIndicators = true
        
        symptomCardViewController.progressRingTintColor = UIColor(netHex: 0x2BC16B)
        
        // Setup controller's title and tab bar icon
        symptomCardViewController.title = "Cuidados"
        symptomCardViewController.tabBarItem = UITabBarItem(title: "Sintomas", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        symptomCardViewController.navigationItem.rightBarButtonItem?.tintColor = UIColor(netHex: 0x2BC16B)
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
    
    func completeEvent(event: OCKCarePlanEvent, withResult result: OCKCarePlanEventResult) {
        storeManager.store.update(event, with: result, state: .completed) { success, _, error in
            if !success {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getAssessmentManager() -> AssessmentsManager {
        return self.assessmentManager
    }
}

