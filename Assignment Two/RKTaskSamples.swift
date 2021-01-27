//
//  StudyTasks.swift
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//
import ResearchKit

/**
 This file contains some sample `ResearchKit` tasks
 that you can modify and use throughout your project!
*/
struct RKTaskSamples {
    
    /**
     Sample task template!
    */
    static let sampleSurveyTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "YES!", noString: "Not now")
        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to start the test?", answer: booleanAnswer)
        
        steps += [booleanStep]
        
        let dateAnswerFormat = ORKDateAnswerFormat(style: .date)
        let numberAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: nil, minimum: 0 as NSNumber, maximum: 100 as NSNumber)
        
        let ageFormItem = ORKFormItem(identifier: "RegistrationForm-Age", text: "How old are you?", answerFormat: numberAnswerFormat, optional: true)
        let dateFormItem = ORKFormItem(identifier: "RegistrationForm-DateQuestion", text: "When did you have surgery?", answerFormat: dateAnswerFormat)
        
        let formStep = ORKFormStep(identifier: "RegistrationForm", title: "About you", text: "Please take a moment to answer some (very) quick questions!")
        formStep.formItems = [dateFormItem, ageFormItem]
        steps += [formStep]
        
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "All done!"
        steps += [summaryStep]
        
        let task = ORKNavigableOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
        
        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, summaryStep.identifier)])
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)
        
        return task
    }()
    
    /**
     Sample task template!
    */
    static let sampleTappingTask: ORKOrderedTask = {
        var steps = [ORKStep]()
        
        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */
        
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "YES!", noString: "Not now")
        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to start the test?", answer: booleanAnswer)
        
        steps += [booleanStep]
        
        // add an active task here
        let tappingTask = ORKOrderedTask.twoFingerTappingIntervalTask(withIdentifier: "TappingTask", intendedUseDescription: "Finger tapping is a universal way to communicate.", duration: 5, handOptions: .right, options: ORKPredefinedTaskOption())
        steps += tappingTask.steps
        
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "Thank you."
        summaryStep.text = "All done!"
        steps += [summaryStep]
        
        let task = ORKNavigableOrderedTask(identifier: "SurveyTappingTask-Assessment", steps: steps)
        
        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(predicate, summaryStep.identifier)])
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)
        
        return task
    }()
}
