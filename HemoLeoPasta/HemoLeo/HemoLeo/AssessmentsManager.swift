//
//  AssessmentsManager.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 16/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import ResearchKit
import CareKit

class AssessmentsManager: NSObject {
    //MARK: - Properties
    
    //Assessments array
    let assessments: [Assessment] = [
        Pain()
    ]
    
    //MARK: - Initialization
    init(carePlanStore: OCKCarePlanStore) {
        super.init()
        
        for assessment in assessments {
            let carePlanActivity = assessment.carePlanActivity()
            
            carePlanStore.addActivity(carePlanActivity) { (success, error) in
                if !success {
                    print(error.debugDescription)
                }
            }
        }
    }
    
    //MARK: - Methods
    
    //Returns the activity that matches with the supplied activity type
    func activityWithType(type: ActivityType) -> Assessment? {
        for activity in assessments where activity.activityType == type {
            print(#function)
            print(activity.activityType)
            return activity
        }
        print("Não deveria entrar aqui")
        return nil
    }
}
