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
        
        let imageChoices = [
            ORKImageChoice(
                normalImage: UIImage(named: "Boca gray")!,
                selectedImage: UIImage(named: "Boca highlighted")!,
                text: "", value: "Boca"
            ),
            ORKImageChoice(
                normalImage: UIImage(named: "Garganta gray"),
                selectedImage: UIImage(named: "Garganta highlighted"),
                text: "", value: "Garganta"
            ),
            ORKImageChoice(
                normalImage: UIImage(named: "Gastro gray"),
                selectedImage: UIImage(named: "Gastro highlighted"),
                text: "", value: "Gastro"
            ),
            ORKImageChoice(
                normalImage: UIImage(named: "Nariz gray"),
                selectedImage: UIImage(named: "Nariz highlighted"),
                text: "", value: "Nariz"
            ),
            ORKImageChoice(
                normalImage: UIImage(named: "Olho gray"),
                selectedImage: UIImage(named: "Olho highlighted"),
                text: "", value: "Olho"
            ),
            ORKImageChoice(
                normalImage: UIImage(named: "Urinario gray"),
                selectedImage: UIImage(named: "Urinario highlighted"),
                text: "", value: "Urinario"
            )]
        
        let bleedingAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
        let bleedingQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: bleedingQuestionStepTitle, answer: bleedingAnswerFormat)
        bleedingQuestionStep.optional = false
        
        steps += [bleedingQuestionStep]
        
        //Second step: How bad is your bleeding?
        let bleedingLevelAnswerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: -1,
            step: 1,
            vertical: false,
            maximumValueDescription: ":(",
            minimumValueDescription: ":)"
        )
        
        let bleedingLevelQuestionStepTitle = "Qual o nível do seu sangramento?"
        let bleedingLevelQuestionStep = ORKQuestionStep(identifier: "BleedingLevelQuestionStep", title: bleedingLevelQuestionStepTitle, answer: bleedingLevelAnswerFormat)
        bleedingLevelQuestionStep.optional = false
        
        steps += [bleedingLevelQuestionStep]
        
        //Create ordered task
        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: steps)
        
        return task
    }
}
