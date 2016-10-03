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
        let schedule = OCKCareSchedule.weeklySchedule(withStartDate: startDate as DateComponents, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        //Get the localized strings to use in the assessment
        let title = NSLocalizedString("Hematomas", comment: "")
        let summary = NSLocalizedString("", comment: "")
        
        //Create the activity
        let activity = OCKCarePlanActivity.assessment(
            withIdentifier: activityType.rawValue,
            groupIdentifier: nil,
            title: title,
            text: summary,
            tintColor: UIColor.red,
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
            ORKTextChoice(text: "Joelho", value: "Joelho" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Ombro", value: "Ombro" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Cotovelo", value: "Cotovelo" as NSCoding & NSCopying & NSObjectProtocol),
            ORKTextChoice(text: "Não tive hematoma", value: "Não tive hematomas" as NSCoding & NSCopying & NSObjectProtocol)
        ]
        
        let bruisingAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
        let bruisingQuestionStep = ORKQuestionStep(identifier: "BruisingQuestionStep", title: bruisingQuestionStepTitle, answer: bruisingAnswerFormat)
        bruisingQuestionStep.isOptional = false
        steps += [bruisingQuestionStep]
        
//        let painQuestionStepTitle = "Onde é a sua dor?"
//        
//        let imageChoices = [
//            ORKImageChoice(
//                normalImage: UIImage(named: "Virilha gray")!,
//                selectedImage: UIImage(named: "Virilha highlighted")!,
//                text: "", value: "Virilha"
//            ),
//            ORKImageChoice(
//                normalImage: UIImage(named: "Tornozelo gray"),
//                selectedImage: UIImage(named: "Tornozelo highlighted"),
//                text: "", value: "Tornozelo"
//            ),
//            ORKImageChoice(
//                normalImage: UIImage(named: "Ombro gray"),
//                selectedImage: UIImage(named: "Ombro highlighted"),
//                text: "", value: "Ombro"
//            ),
//            ORKImageChoice(
//                normalImage: UIImage(named: "Cotovelo gray"),
//                selectedImage: UIImage(named: "Cotovelo highlighted"),
//                text: "", value: "Cotovelo"
//            ),
//            ORKImageChoice(
//                normalImage: UIImage(named: "Joelho gray"),
//                selectedImage: UIImage(named: "Joelho highlighted"),
//                text: "", value: "Joelho"
//            ),
//            ORKImageChoice(
//                normalImage: UIImage(named: "Punho gray"),
//                selectedImage: UIImage(named: "Punho highlighted"),
//                text: "", value: "Punho"
//            )]
//        
//        let painAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
//        let painQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: painQuestionStepTitle, answer: painAnswerFormat)
//        
//        steps += [painQuestionStep]
        
        //Second step: How bad is your bruise?
        let bruisingLevelAnswerFormat = ORKScaleAnswerFormat(
            maximumValue: 10,
            minimumValue: 0,
            defaultValue: -1,
            step: 1,
            vertical: false,
            maximumValueDescription: "Grande",
            minimumValueDescription: "Pequeno"
        )
        
        let bruisingLevelQuestionStepTitle = "Qual o tamanho do hematoma?"
        let bruisingLevelQuestionStep = ORKQuestionStep(identifier: "BruisingLevelQuestionStep", title: bruisingLevelQuestionStepTitle, answer: bruisingLevelAnswerFormat)
        bruisingLevelQuestionStep.isOptional = false
        
        steps += [bruisingLevelQuestionStep]
        
        //Create ordered task
//        let task = ORKOrderedTask(identifier: activityType.rawValue, steps: steps)
        let task: ORKNavigableOrderedTask = ORKNavigableOrderedTask(identifier: activityType.rawValue, steps: steps)
        
        return task
        
    }
}
