//
//  Assignment_TwoApp.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct Assignment_TwoApp: App {
    
    init() {
        
        // Configure our Firebase instance & sign-in anonymously
        // Your application must have a valid GoogleService-Info.plist config file from Firebase.
        // NOTE: you must enable anonymous auth by:
        //  (1) open https://console.firebase.google.com/
        //  (2) open the Auth section
        //  (3) On the Sign-in Methods page, enable the Anonymous sign-in method.
        
        // FirebaseApp.configure()
        // Auth.auth().signInAnonymously()
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
