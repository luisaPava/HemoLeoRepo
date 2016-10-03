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
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: occurrences as [NSNumber])
        
        // Set information for the activity
        let title = NSLocalizedString("Agua", comment: "")
        let summary = NSLocalizedString("400ml", comment: "")
        let instructions = NSLocalizedString("É muito importante beber bastante água, com um total de 2L", comment: "")
        
        // Setup the activity
        let activity = OCKCarePlanActivity.intervention(
            withIdentifier: activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.blue,
            instructions: instructions,
            imageURL: nil,
            schedule: schedule,
            userInfo: nil
        )
        

        return activity
    }
}
