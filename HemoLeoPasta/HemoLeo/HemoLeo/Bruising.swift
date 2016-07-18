//
//  Bruising.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 18/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit
import ResearchKit

class Bruising: Assessment {
    //MARK: - Activity
    let activityType: ActivityType = .Bruising
    
    func carePlanActivity() -> OCKCarePlanActivity {
        //Create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strings to use in the assessment
        let title = NSLocalizedString("Hematomas", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessmentWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.redColor(),
            resultResettable: true,
            schedule: schedule,
            userInfo: nil
        )
        
        return activity
    }
    
    //MARK: - Assessment
    func task() -> ORKTask {
        //Steps array
        var steps = [ORKStep]()
        
        //Create questions and answer formats
        
        //First step: Where is your bruise?
        let bruisingQuestionStepTitle = "Onde é o seu hematoma?"
        let textChoices = [
            ORKTextChoice(text: "Joelho", value: "joelho"),
            ORKTextChoice(text: "Ombro", value: "ombro"),
            ORKTextChoice(text: "Cotovelo", value: "cotovelo"),
            ORKTextChoice(text: "Não tive hematoma", value: "não tive hematomas")
        ]
        
        let bruisingAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
        let bruisingQuestionStep = ORKQuestionStep(identifier: "BruisingQuestionStep", title: bruisingQuestionStepTitle, answer: bruisingAnswerFormat)
        steps += [bruisingQuestionStep]
        
        //Second step: How bad is your bruise?
        let bruisingLevelAnswerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: -1,
            step: 1,
            vertical: false,
            maximumValueDescription: "Estou morrendo!",
            minimumValueDescription: "Nah"
        )
        
        let bruisingLevelQuestionStepTitle = "Qual o tamanho do hematoma?"
        let bruisingLevelQuestionStep = ORKQuestionStep(identifier: "BruisingLevelQuestionStep", title: bruisingLevelQuestionStepTitle, answer: bruisingLevelAnswerFormat)
        
        steps += [bruisingLevelQuestionStep]
        
        //Create ordered task
//        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: steps)
        let task: ORKNavigableOrderedTask = ORKNavigableOrderedTask(identifier: activityType.rawValue, steps: steps)
        
        return task
        
    }
}
