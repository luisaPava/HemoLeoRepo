//
//  Exercise.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit

class Exercise: Activity {
    let activityType: ActivityType = .Exercise
    static var occurrences: [Int] = [Int]()
    var extraInfo: String = String()
    var icon: UIImage? = UIImage(named: "exercise")
    
    func carePlanActivity() -> OCKCarePlanActivity {
        
        // Setup the weekly schedule for the activity
        let startDate = NSDateComponents(year: 2016, month: 1, day: 1)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: Exercise.occurrences)
        
        // Set information for the activity
        let title = NSLocalizedString("Exercicio", comment: "")
        let summary = NSLocalizedString("Leve", comment: "")
        let instructions = NSLocalizedString("Natação, caminhada ou andar de bicicleta", comment: "")
        
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
        
        Exercise.occurrences = customOccurencies
        
        return carePlanActivity()
    }
}