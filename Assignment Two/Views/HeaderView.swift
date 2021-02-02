//
//  HeaderView.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    
    let color: Color
    
    init(backgroundColor: Color = Color.white) {
        self.color = backgroundColor
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, alignment: .leading)
            }.padding(.horizontal, 20.0)
            HStack {
                Text("Experience Sampling")
                    .font(.system(.largeTitle))
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20.0)
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Please take a moment to fill out this quick survey!")
                        .minimumScaleFactor(0.5)
                }
                Spacer()
                Image("HPDS-cover-image").resizable().scaledToFit().frame(width: 150)
            }.padding(.horizontal, 20.0)
            
        }.background(color)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
