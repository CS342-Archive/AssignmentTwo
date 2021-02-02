//
//  CardStackView.swift
//  Assignment Two
//
//  Created by Michael Cooper on 2021-02-02.
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

struct CardStackView: View {
    
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
        let cards_restack:[CardContent] =  Array(cards)
        
        VStack {

            GeometryReader { geometry in
                HStack {
                    ZStack {
                        
                        VStack {
                            Spacer()
                            Text("You're all caught up! 🚀").frame(maxWidth: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding()
                            Button(action: {
                                // TODO restacking the cards doesn't work
                                    self.cards = cards_restack
                                
                            }) {
                                Image(systemName: "arrow.clockwise.icloud")
                            }
                            Spacer()
                        }
                        
                        ForEach(self.cards.reversed(), id: \.self) { curr_card in
                            CardView(card: curr_card, onRemove: { removedCard in
                                self.cards.removeAll { $0.id == removedCard.id }
                            })
                                .offset(x: 0, y: self.getCardOffset(geometry, id: curr_card.id))
                        }
                        

                    }


                    
                }
            }
    }
    }
}
