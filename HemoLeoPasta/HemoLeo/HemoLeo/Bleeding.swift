//
//  Bleeding.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 18/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit
//import ResearchKit

class Bleeding: Assessment {
    //MARK: - Activity
    let activityType: ActivityType = .Bleeding
    
    func carePlanActivity() -> OCKCarePlanActivity {
        //Create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strungs to use in the assessment
        let title = NSLocalizedString("Sangramento", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.red,
            resultResettable: true,
            schedule: schedule,
            userInfo: nil
        )
        
        return activity
    }
}
