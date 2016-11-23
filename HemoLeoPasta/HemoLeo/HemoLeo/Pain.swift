//
//  Pain.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 16/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//
import Foundation
import CareKit
//import ResearchKit

class Pain: Assessment {
    //MARK: - Activity
    let activityType: ActivityType = .Pain
    
    func carePlanActivity() -> OCKCarePlanActivity {
        //Create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strings to use in the assessment
        let title = NSLocalizedString("Dor", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor(netHex: 0x2ecc71),
            resultResettable: true,
            schedule: schedule,
            userInfo: nil
        )
        
        return activity
    }
}
