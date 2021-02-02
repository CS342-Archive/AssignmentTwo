//
//  SurveyView.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI
import ResearchKit

struct SurveyView: View {
    
    @State var taskController: CKTaskViewController? = nil
    @State var surveyOptional: ORKOrderedTask? = nil {
        didSet {
            if let surveyOptional = surveyOptional {
                taskController = CKTaskViewController(tasks: surveyOptional)
            }
        }
    }
    
    fileprivate let color: Color
    
    init(backgroundColor: Color = Color.white) {
        self.color = backgroundColor
    }
    
    var body: some View {
        VStack {
            Button(action: {
                /*
                    CS342 -- ASSIGNMENT 2
                    Set surveyOptional to any ResearchKit task of your choice!
                    The task must conform to the ORKOrderedTask class.
                 */
                
                surveyOptional = RKTaskSamples.sampleSurveyTask
            }) {
                RoundedTextView("Start Survey", backgroundColor: .red)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(color)
        .sheet(item: $taskController, content: { item in
            item
        })
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
