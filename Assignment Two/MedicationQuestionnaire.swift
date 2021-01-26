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
struct MedicationQuestionnaire {
    
    /**
     Sample task template!
    */
    static let form: ORKOrderedTask = {
        
        var steps = [ORKStep]()
        
        /*
            CS342 -- ASSIGNMENT 2
            Add steps to the array above to create a survey!
         */
        
        // Q1
        let firstStepAnswerFormat = ORKBooleanAnswerFormat()
        let firstStep = ORKQuestionStep(identifier: "Q1", title: "Q1", question: "Do you have your medications currently?", answer: firstStepAnswerFormat)
        steps.append(firstStep)
        
        // Q2
        let secondStep = ORKQuestionStep(identifier: "Q2", title: "Q2", question: "How many medications do you currently take for heart problems?", answer: ORKAnswerFormat.decimalAnswerFormat(withUnit: nil))
        steps.append(secondStep)
        
        // Q3
        let thirdStepAnswerFormat = ORKBooleanAnswerFormat()
        let thirdStep = ORKQuestionStep(identifier: "Q3", title: "Q3", question: "Have you stopped taking any medications for heart problems in the last 6 months?", answer: thirdStepAnswerFormat)
        steps.append(thirdStep)
        
        // Q4
        
        // Q5
        
        // Q6
        
        // Q7
        
        // Q8
        
        // Q9
        
        // Q10
        
        // Q11
        
        // Q12
        
        
        return ORKOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
    }()
}
