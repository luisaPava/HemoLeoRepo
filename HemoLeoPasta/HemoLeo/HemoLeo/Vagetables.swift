//
//  Vagetables.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class Vegetables: Activity {
    
    let activityType: ActivityType = .Vegetables
    var occurrences: [Int] = [Int]()
    var extraInfo: String = String()
    var icon: UIImage? = UIImage(named: "vegetais")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        occurrences = [2, 2, 2, 2, 2, 2, 2]
        
        // Setup the weekly schedule for the activity
        let startDate = NSDateComponents(year: 2016, month: 1, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: occurrences)
        
        // Set information for the activity
        let title = NSLocalizedString("Vegetais", comment: "")
        let summary = NSLocalizedString("Verduras e legumes", comment: "")
        let instructions = NSLocalizedString("Comer \(occurrences.first!) porções de verduras ou legumes por dia. Cenoura, beterraba e folhas verde escuras" + extraInfo, comment: "")
        
        // Setup the activity
        let activity = OCKCarePlanActivity.interventionWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.greenColor(),
            instructions: instructions,
            imageURL: NSURL(string: "https://webappstatic.buzzfeed.com/static/images/public/verticals/food-title.png"),
            schedule: schedule,
            userInfo: nil
        )
        
        
        return activity
    }

}
