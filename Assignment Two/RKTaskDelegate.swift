//
//  RKTaskDelegate.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import ResearchKit

extension CKTaskCoordinator: ORKTaskViewControllerDelegate {
    
    public func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        switch reason {
        case .completed:
            do {
                 // (1) convert the result of the ResearchKit task into a JSON dictionary
                 if let json = try CKTaskResultAsJson(taskViewController.result) {
                     
                     // (2) send using Firebase
                     try CKSendJSON(json)
                     
                     // (3) if we have any files, send those using Google Storage
                     if let associatedFiles = taskViewController.outputDirectory {
                         try CKSendFiles(associatedFiles, result: json)
                     }
                 }
             } catch {
                 print(error.localizedDescription)
             }
            fallthrough
        default:
            taskViewController.dismiss(animated: true, completion: nil)
            
        }
    }
    
}
