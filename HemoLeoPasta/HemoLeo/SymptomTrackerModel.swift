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
    
    private override init() { }
    
    func createSymtomTracker() -> OCKSymptomTrackerViewController {
        let symptomCardViewController = OCKSymptomTrackerViewController(carePlanStore: sharedCarePlanStore.store)
        
        symptomCardViewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        symptomCardViewController.title = "Cuidados"
        symptomCardViewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        symptomCardViewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        return symptomCardViewController
    }
    
    func 
}

