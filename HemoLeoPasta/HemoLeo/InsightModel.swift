//
//  InsightModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class InsightModel {
    static let sharedInsightModel = InsightModel()
    
    private init() {
    
    }
    
    func createInisight() -> OCKInsightsViewController {
        let insightItem = OCKInsightItem()
        let insightViewController = OCKInsightsViewController(insightItems: [insightItem])
        
        return insightViewController
    }
}
