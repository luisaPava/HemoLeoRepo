//
//  Bleeding.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 18/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import CareKit
import ResearchKit

class Bleeding: Assessment {
    //MARK: - Activity
    let activityType: ActivityType = .Bleeding
    
    func carePlanActivity() -> OCKCarePlanActivity {
        //Create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strungs to use in the assessment
        let title = NSLocalizedString("Sangramento", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessmentWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.brownColor(),
            resultResettable: true,
            schedule: schedule,
            userInfo: nil
        )
        
        return activity
    }
    
    //MARK: - Assessment
    func task() -> ORKTask {
        //steps array
        var steps = [ORKStep]()
        
        //Create questions and answer formats
        
        //First step: Where is your bleeding?
        let bleedingQuestionStepTitle = "Onde é o seu sangramento?"
        let textChoices = [
            ORKTextChoice(text: "Nariz", value: "nariz"),
            ORKTextChoice(text: "Boca", value: "boca"),
            ORKTextChoice(text: "Olhos", value: "olhos"),
            ORKTextChoice(text: "Outro", value: "outro")
        ]
        
        let bleedingAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
        let bleedingQuestionStep = ORKQuestionStep(identifier: "BleedingQuestionStep", title: bleedingQuestionStepTitle, answer: bleedingAnswerFormat)
        steps += [bleedingQuestionStep]
        
        //Second step: How bad is your bleeding?
        let bleedingLevelAnswerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: -1,
            step: 1,
            vertical: false,
            maximumValueDescription: "Bleeding to death",
            minimumValueDescription: "Cool"
        )
        
        let bleedingLevelQuestionStepTitle = "Qual o nível do seu sangramento?"
        let bleedingLevelQuestionStep = ORKQuestionStep(identifier: "BleedingLevelQuestionStep", title: bleedingLevelQuestionStepTitle, answer: bleedingLevelAnswerFormat)
        
        steps += [bleedingLevelQuestionStep]
        
        //Create ordered task
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: steps)
        
        return task
    }
}
