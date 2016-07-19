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
    func buildResultForCarePlanEvent(event: OCKCarePlanEvent, taskResult: ORKTaskResult) -> OCKCarePlanEventResult {
        // Get the first result for the first step of the task result.
        guard let firstResult = taskResult.firstResult as? ORKStepResult, stepResult = firstResult.results?.first else { fatalError("Unexepected task results") }
        
//        var result = ORKResult()
//        for i in firstResult.results! where i.identifier == "step 1" {
//            result = i
//        }
//        
//        let boolResult = result as! ORKBooleanQuestionResult
//        
//        if boolResult.booleanAnswer == false {
//            print("Entrou")
//            if let scaleResult = stepResult as? ORKBooleanQuestionResult, answer = scaleResult.booleanAnswer {
//                return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: "out of 10", userInfo: nil)
//            }
//        }

        // Determine what type of result should be saved.
        if let scaleResult = stepResult as? ORKScaleQuestionResult, answer = scaleResult.scaleAnswer {
            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: "out of 10", userInfo: nil)
        }
        else if let numericResult = stepResult as? ORKNumericQuestionResult, answer = numericResult.numericAnswer {
            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: numericResult.unit, userInfo: nil)
            
        } else if let scaleResult = stepResult as? ORKBooleanQuestionResult, answer = scaleResult.booleanAnswer {
            return OCKCarePlanEventResult(valueString: answer.stringValue, unitString: "out of 10", userInfo: nil)
            
        } else if let textResult = stepResult as? ORKChoiceQuestionResult, answer = textResult.choiceAnswers {
//            print(answer.first!.stringValue)
            return OCKCarePlanEventResult(valueString: answer.first as! String, unitString: "", userInfo: nil)
        }
        
        fatalError("Unexpected task result type")
    }
}
