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
struct GeneralPatientQuestionnaire {
    
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
        let firstStepAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
        let firstStep = ORKQuestionStep(identifier: "SF-12-1", title: "Patient Questionnaire", question: "In general, how would you describe your health?", answer: firstStepAnswerFormat)
        steps.append(firstStep)
        
        // Q2
        
        // Q3
        
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
