//
//  ContentView.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()

            CardStackView()
            
            SurveyView(backgroundColor: Color.gray.opacity(0.2))
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
