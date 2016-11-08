//
//  Assessment.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 16/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit
import ResearchKit

//Protocol that adds a method to the `Activity` protocol that returns an `ORKTask` to present to the user.
protocol Assessment: Activity {
    func task() -> ORKTask
}

extension Assessment {
    func buildResultForCarePlanEvent(event: OCKCarePlanEvent, taskResult: String) -> OCKCarePlanEventResult {
        // Get the first result for the first step of the task result.
//        guard let firstResult = taskResult.firstResult as? ORKStepResult, let stepResult = firstResult.results?.first else { fatalError("Unexepected task results") }
//
//        // Determine what type of result should be saved.
//        if let scaleResult = stepResult as? ORKScaleQuestionResult, let answer = scaleResult.scaleAnswer {
//            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: "out of 10", userInfo: nil)
//        }
//        else if let numericResult = stepResult as? ORKNumericQuestionResult, let answer = numericResult.numericAnswer {
//            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: numericResult.unit, userInfo: nil)
//            
//        } else if let scaleResult = stepResult as? ORKBooleanQuestionResult, let answer = scaleResult.booleanAnswer {
//            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: "", userInfo: nil)
//            
//        } else if let textResult = stepResult as? ORKChoiceQuestionResult, let answer = textResult.choiceAnswers {
//            return OCKCarePlanEventResult(valueString: answer.first as! String, unitString: "", userInfo: nil)
//            
//        }
        
        return OCKCarePlanEventResult(valueString: taskResult, unitString: "", userInfo: nil)
        
        
//        fatalError("Unexpected task result type")
    }
}
