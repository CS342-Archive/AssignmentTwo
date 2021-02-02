//
//  CardView.swift
//  Assignment Two
//
//  Created by Michael Cooper on 2021-02-02.
//  Credit to Brandon Baars for the tutorial on this card UX.

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct CardView: View {
    
    @State private var translation: CGSize = .zero
    private var card: CardContent
    private var onRemove: (_ card: CardContent) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    init(card: CardContent, onRemove: @escaping (_ user: CardContent) -> Void) {
        self.card = card
        self.onRemove = onRemove
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader() { geometry in
            // The ZStack is a hack to get it to center the cards
            ZStack {
                        
            VStack {
                Image(self.card.imageName)
                    .resizable()
                    .frame(width: UIScreen.screenWidth*0.32, height: UIScreen.screenWidth*0.28)
                    .padding()
                
                HStack {
                    VStack {
                        Text("\(self.card.title)")
                            .font(.system(size: 25))
                            .bold()
                            .multilineTextAlignment(.center)

                    }
                }.frame(width: UIScreen.screenWidth*0.8, height: UIScreen.screenHeight*0.07)
            }
            // Add padding, corner radius and shadow with blur radius
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .offset(x: self.translation.width, y: 0)
             .gesture(
                 DragGesture()
                     .onChanged { value in
                         self.translation = value.translation
                     }.onEnded { value in
                        // determine snap distance > 0.5 aka half the width of the screen
                            if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                                self.onRemove(self.card)
                            } else {
                                self.translation = .zero
                            }
                        }
             )
        }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardContent(id: 1, title: "Welcome to Your Day", imageName: "card_1"),
                 onRemove: { _ in
                    // do nothing
        }).frame(height: 400).padding()
    }
}
