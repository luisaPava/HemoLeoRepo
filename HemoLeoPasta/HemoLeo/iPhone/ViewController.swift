//
//  ViewController.swift
//  iPhone
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class ViewController: UITabBarController {
    private let careCardModel = CareCardModel.sharedCareCardModel
    private let symptomTrackerModel = SymptomTrackerModel.sharedSymptomTracker
    private let insightModel = InsightModel.sharedInsightModel
    
    private var careCardViewController: OCKCareCardViewController!
    private var symptomTrackerViewController: OCKSymptomTrackerViewController!
    private var insightsViewController: OCKInsightsViewController!
    private var connectViewController: OCKConnectViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        careCardViewController = careCardModel.createCareCard()
        symptomTrackerViewController = symptomTrackerModel.createSymtomTracker()
        
        self.viewControllers = [ UINavigationController(rootViewController: careCardViewController),
                                 UINavigationController(rootViewController: symptomTrackerViewController), ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

