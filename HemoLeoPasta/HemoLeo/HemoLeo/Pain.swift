//
//  Pain.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 16/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//
import Foundation
import CareKit
import ResearchKit

class Pain: Assessment {
    //MARK: - Activity
    let activityType: ActivityType = .Pain
    
    func carePlanActivity() -> OCKCarePlanActivity {
        //Create a weekly schedule
        let startDate = NSDateComponents(year: 2016, month: 01, day: 01)
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(startDate, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strings to use in the assessment
        let title = NSLocalizedString("Dor", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessmentWithIdentifier(
            activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.blueColor(),
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
        
        //First step: Where is your pain?
        let painQuestionStepTitle = "Onde é a sua dor?"
        let textChoices = [
            ORKTextChoice(text: "Joelho", value: "joelho"),
            ORKTextChoice(text: "Ombro", value: "ombro"),
            ORKTextChoice(text: "Cotovelo", value: "cotovelo"),
            ORKTextChoice(text: "Não tive dor", value: "não tive dor")
        ]
        
        let painAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
        let painQuestionStep = ORKQuestionStep(identifier: "PainQuestionStep", title: painQuestionStepTitle, answer: painAnswerFormat)
        
        
        steps += [painQuestionStep]
        
        //Second step: How bad is your pain?
        let painLevelAnswerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: -1,
            step: 1,
            vertical: false,
            maximumValueDescription: "Estou morrendo!",
            minimumValueDescription: "Nah"
        )
        
        
        let painLevelQuestionStepTitle = "Qual o nível da dor?"
        let painLevelQuestionStep = ORKQuestionStep(identifier: "PainLevelQuestionStep", title: painLevelQuestionStepTitle, answer: painLevelAnswerFormat)
        
        steps += [painLevelQuestionStep]
        
        //Create ordered task
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: steps)
        
        
        return task
        
    }
}