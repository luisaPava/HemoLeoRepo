//
//  Shot.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class Shot: Activity {
    let activityType: ActivityType = .Shot
    var occurrences: [Int] = [Int]()
    var extraInfo: String = String()
    var icon: UIImage? = UIImage(named: "shot")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        if occurrences.isEmpty {
            occurrences = [1, 1, 1, 1, 1, 1, 1]
        }
        
        // Setup the weekly schedule for the activity
        let startDate = NSDateComponents(year: 2016, month: 1, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: occurrences)
        
        // Set information for the activity
        let title = NSLocalizedString("Aplicação", comment: "")
        let summary = NSLocalizedString("", comment: "")
        let instructions = NSLocalizedString("", comment: "")
        
        // Setup the activity
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.lightGrayColor(),
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil
        )
        
        return activity
    }
    
    func carePlanActivityCustom(customOccurencies: [Int]) -> OCKCarePlanActivity {
        
        occurrences = customOccurencies
        
        return carePlanActivity()
    }
}