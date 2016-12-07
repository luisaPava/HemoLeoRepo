//
//  Shot.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class Shot: Activity {
    let activityType: ActivityType = .Profilaxia
    var occurrences: [Int] = [Int]()
    var extraInfo: String = String()
    var icon: UIImage? = UIImage(named: "shot")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        if occurrences.isEmpty {
            occurrences = [1, 1, 1, 1, 1, 1, 1]
        }
        
        // Setup the weekly schedule for the activity
        let startDate = NSDateComponents(year: 2016, month: 1, day: 1)
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: occurrences as [NSNumber])
        
        // Set information for the activity
        let title = NSLocalizedString("Profilaxia", comment: "")
//        let summary = NSLocalizedString("", comment: "")
        let instructions = NSLocalizedString("Siga as orioentações do seu médico. Instruções detalhadas podem ser econtradas em \"tutorial\"", comment: "")
        
        // Setup the activity
        let activity = OCKCarePlanActivity.intervention(
            withIdentifier: activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: nil,
            tintColor: UIColor.lightGray,
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
