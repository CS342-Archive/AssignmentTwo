//
//  ContentView.swift
//  Assignment Two
//
//  Created for Biodesign's CS342
//  Copyright © 2019 Stanford University.
//  All rights reserved.
//

import SwiftUI

struct CardContent: Hashable, CustomStringConvertible {
    var id: Int
    let title: String
    let imageName: String

    var description: String {
        return "\(title), id: \(id)"
    }
}

struct ContentView: View {
    
    // List the cards to display
    @State var cards: [CardContent] = [
        CardContent(id: 0, title: "Welcome to Your Day.", imageName: "card_1"),
        CardContent(id: 1, title: "Observe Your Environment.", imageName: "card_2"),
        CardContent(id: 2, title: "Complete Occasional Surveys.", imageName: "card_3"),
        CardContent(id: 3, title: "And Have a Wonderful Day!", imageName: "card_4"),
    ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(cards.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(cards.count - 1 - id) * 5
    }
    
    
    var body: some View {
        VStack {
            HeaderView()

            GeometryReader { geometry in
                HStack {
                    ZStack {
                        
                        ForEach(self.cards.reversed(), id: \.self) { curr_card in
                            CardView(card: curr_card, onRemove: { removedCard in
                                // Remove that user from our array
                                self.cards.removeAll { $0.id == removedCard.id }
                            })
                                .offset(x: 0, y: self.getCardOffset(geometry, id: curr_card.id))
                        }
                        
                    }
                    
                }
            }
            
            
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
