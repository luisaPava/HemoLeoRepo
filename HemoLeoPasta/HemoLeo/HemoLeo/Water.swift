//
//  Water.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class Water: Activity {
    let activityType: ActivityType = .Water
    var occurrences: [Int] = [Int]()
    var extraInfo: String = String()
    var icon: UIImage? = UIImage(named: "water")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        occurrences = [5, 5, 5, 5, 5, 5, 5]
        
        // Setup the weekly schedule for the activity
        let startDate = NSDateComponents(year: 2016, month: 1, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: occurrences)
        
        // Set information for the activity
        let title = NSLocalizedString("Água", comment: "")
        let summary = NSLocalizedString("400ml", comment: "")
        let instructions = NSLocalizedString("É muito importante beber bastante água, com um total de 2L", comment: "")
        
        // Setup the activity
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.blueColor(),
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil
        )
        
        activity.imageName = "water"
        
        return activity
    }
}
