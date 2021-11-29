//
//  CardView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI

struct CardView: View {
    var content:MemoryGame<String>.Card
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if content.isFaceUp{
                shape.fill(.white)
                    .transition(CardView.moveAndFade)
                shape.strokeBorder(lineWidth: 2)
                Text(content.content).font(Font(.init(.label, size: 70)))
            } else {
                shape.fill()
                    .transition(CardView.moveAndFade)
            }
        }.opacity(content.isMatched ? 0.02 : 1.0)
    }
    
    static var moveAndFade: AnyTransition {
 //       .opacity
            .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .slide.combined(with: .opacity)
            )
        }
}
