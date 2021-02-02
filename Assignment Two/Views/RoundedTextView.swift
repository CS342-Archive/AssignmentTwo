//
//  RoundedTextView.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI

struct RoundedTextView: View {
    
    let text: String
    
    let color: Color
    
    init(_ text: String, backgroundColor: Color = Color.blue) {
        self.text = text
        self.color = backgroundColor
    }
    
    var body: some View {
        Text(text)
            .font(.system(.body))
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .cornerRadius(10)
            .accentColor(.white)
            .padding()
    }
}


struct RoundedTextView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
