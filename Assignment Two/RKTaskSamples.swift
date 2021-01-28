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
//struct RKTaskSamplesDemoInClass {
//
//    /**
//     Sample task template!
//    */
//    static let sampleSurveyTask: ORKOrderedTask = {
//        var steps = [ORKStep]()
//
//        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "YES!", noString: "Not now") // let for constants that are not changing
//        let booleanStep = ORKQuestionStep(identifier: "AreYouReady-Boolean", title: "Before we get started...", question: "Are you ready to take the test?", answer: booleanAnswer)
//
//        steps += [booleanStep]
//
//        // Formats
//        let dateAnswerFormat = ORKDateAnswerFormat(style: .date)
//        let numberAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: nil, minimum: 18 as NSNumber, maximum: 100 as NSNumber)
//
//        // Date Form Item
//        let dateFromItem = ORKFormItem(identifier: "RegistrationForm-DateQuestion", text: "When did you have surgery?", answerFormat: dateAnswerFormat)
//
//        // Age Form Item
//        let ageFromItem = ORKFormItem(identifier: "RegistrationForm-Age", text: "How old are you?", answerFormat: numberAnswerFormat)
//
//        let formStep = ORKFormStep(identifier: "RegistrationForm", title: "About you", text: "Please take a moment to answer some (very) quick questions!")
//
//        formStep.formItems = [dateFromItem, ageFromItem]
//        steps += [formStep]
//
//        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
//        summaryStep.title = "thank you"
//        summaryStep.text = "All done!"
//        steps += [summaryStep]
//
//        // create navigable rule
//        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
//        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
//
//        // navigable lets you skip questions, children of ORKOrderedTask
//        let task =  ORKNavigableOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
//        // if get a false on the boolean step, do the summary step
//        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: predicate, destinationStepIdentifier: summaryStep.identifier)])
//        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)
//        return task
//    }()
//}


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
        // Formats
        let answerFormatEmail = ORKAnswerFormat.emailAnswerFormat()
        let stringAnswerFormat = ORKTextAnswerFormat()
        let dateAnswerFormat = ORKDateAnswerFormat(style: .date)
        let numberAnswerFormat = ORKNumericAnswerFormat(style: .integer, unit: nil, minimum: 18 as NSNumber, maximum: 100 as NSNumber)
        
        // Question 1 is getting name, email, and age
        let AboutYouFormItem = ORKFormItem(sectionTitle: "Personal information")
        let firstNameFormItem = ORKFormItem(identifier: "RegistrationForm-FirstName", text: "First Name", answerFormat: stringAnswerFormat)
        let lastNameFormItem = ORKFormItem(identifier: "RegistrationForm-LastName", text: "Last Name", answerFormat: stringAnswerFormat)
        let ageFromItem = ORKFormItem(identifier: "RegistrationForm-Age", text: "Age", answerFormat: numberAnswerFormat)
        let emailFormItem = ORKFormItem(identifier: "RegistrationForm-Email", text: "Email", answerFormat: answerFormatEmail)
        // registration form
        let formStep = ORKFormStep(identifier: "RegistrationForm", title: "About you", text: "Before we get started, tell us a little bit about yourself")
        formStep.formItems = [AboutYouFormItem, firstNameFormItem, lastNameFormItem, ageFromItem, emailFormItem]
        steps += [formStep]
        
        // Question 2 is asking about skin type (oily, combination, dry)
        let skinTypes = [
          ORKTextChoice(text: "Oily", value: 0 as NSNumber),
          ORKTextChoice(text: "Combination", value: 1 as NSNumber),
          ORKTextChoice(text: "Dry", value: 2 as NSNumber)
        ]
        let skinTypeAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: skinTypes)
        let skinTypeQuestionStep = ORKQuestionStep(identifier: "SkinTypeQuestionStep", title: "Skin Type", question: "How would you describe your skin?", answer: skinTypeAnswerFormat)
        steps += [skinTypeQuestionStep]
        
        // Question 3 is aking about main concern (clogged pores, control breakouts, acne scars)
        let skinIssues = [
          ORKTextChoice(text: "Control breakouts", value: 0 as NSNumber),
          ORKTextChoice(text: "Clean clogged pores", value: 1 as NSNumber),
          ORKTextChoice(text: "Reduce acne scars", value: 2 as NSNumber),
          ORKTextChoice(text: "Fade dark spots", value: 3 as NSNumber),
          ORKTextChoice(text: "Fight wrinkles", value: 4 as NSNumber),
          ORKTextChoice(text: "Reduce fine lines", value: 5 as NSNumber),
        ]
        let skinConcernAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: skinIssues)
        let skinIssuesQuestionStep = ORKQuestionStep(identifier: "SkinIssuesQuestionStep", title: "Goals", question: "What would you like to improve about your skin?", answer: skinConcernAnswerFormat)
        steps += [skinIssuesQuestionStep]
        
        // Question 4 is asking about allergies
        let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
        let booleanStep = ORKQuestionStep(identifier: "Allergies-Boolean", title: "Allergies", question: "Do you have any allergies?", answer: booleanAnswer)
        booleanStep.isOptional = false
        steps += [booleanStep]
        
        // if yes then we ask the user to enter them in a text box
        let allergiesAnswerFormat = ORKTextAnswerFormat(maximumLength: 200)
        allergiesAnswerFormat.multipleLines = true
        let allergiesQuestionStep = ORKQuestionStep(identifier: "AllergiesQuestionStep", title: "Allergies", question: "Please describe your allergies.", answer: allergiesAnswerFormat)
        steps += [allergiesQuestionStep]
        
        // Question 5 is asking to upload a photo
        let instructionStep = ORKInstructionStep(identifier: "imageCaptureInstructionStep")
        instructionStep.title = NSLocalizedString("Time to take a selfie", comment: "")
        instructionStep.text = "Please take a photo of yourself, position your face as indicated and make sure you have good lighting."
        let handSolidImage = UIImage(named: "Portrait")!
        instructionStep.image = handSolidImage.withRenderingMode(.alwaysTemplate)
        instructionStep.isOptional = false
        let imageCaptureStep = ORKImageCaptureStep(identifier: "imageCaptureStep")
        imageCaptureStep.title = NSLocalizedString("Image Capture", comment: "")
        imageCaptureStep.isOptional = true
        imageCaptureStep.accessibilityInstructions = NSLocalizedString("Your instructions for capturing the image", comment: "")
        imageCaptureStep.accessibilityHint = NSLocalizedString("Captures the image visible in the preview", comment: "")
        
        imageCaptureStep.templateImage = UIImage(named: "Portrait")!
        
        imageCaptureStep.templateImageInsets = UIEdgeInsets(top: 0.05, left: 0.05, bottom: 0.05, right: 0.05)
        steps += [instructionStep, imageCaptureStep]
        
        // Summary step
        let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
        summaryStep.title = "All done!"
        summaryStep.text = "Our AI will review this information and create a customized skincare routine for you!"
        steps += [summaryStep]
        
        // create navigable rule for allergy question
        let resultBooleanSelector = ORKResultSelector(resultIdentifier: booleanStep.identifier)
        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: resultBooleanSelector, expectedAnswer: false)
        let navigableRule = ORKPredicateStepNavigationRule(resultPredicatesAndDestinationStepIdentifiers: [(resultPredicate: predicate, destinationStepIdentifier: instructionStep.identifier)])
        
        // create task grouping all steps
        let task =  ORKNavigableOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
        task.setNavigationRule(navigableRule, forTriggerStepIdentifier: booleanStep.identifier)
        return task
    }()
}
