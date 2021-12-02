//
//  CardView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI

struct CardView: View {
    let card:MemoryGame<String>.Card
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if card.isFaceUp{
                shape.fill(.white)
                    .transition(CardView.moveAndFade)
                shape.strokeBorder(lineWidth: 2)
                Text(card.content).font(Font(.init(.label, size: 70)))
            } else {
                shape.fill()
                    .transition(CardView.moveAndFade)
                shape.strokeBorder(.white, lineWidth: 3.0)
            }
        }.opacity(card.isMatched ? 0.02 : 1.0)
    }
    
    static var moveAndFade: AnyTransition {
            .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .slide.combined(with: .opacity)
            )
        }
}
struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(isFaceUp:true,isMatched:false,content: "🚓", id: 2))
            .preferredColorScheme(.dark)
    }
}
