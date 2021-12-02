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
        let shape = RoundedRectangle(cornerRadius:Constants.cornerRadius)
        GeometryReader { geometry in
            
            ZStack {
                if card.isFaceUp{
                    shape.fill(.white).transition(CardView.moveAndFade)
                    shape.strokeBorder(lineWidth: Constants.lineWidth)
                    Text(card.content).font(cardFont(size: geometry.size))
                } else {
                    shape.fill()
                        .transition(CardView.moveAndFade)
                    shape.strokeBorder(.white, lineWidth: Constants.lineWidth)
                }
            }.opacity(card.isMatched ? 0 : 1.0)
        }
    }
    
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .slide.combined(with: .opacity)
        )
    }

    private func cardFont(size:CGSize) -> Font {
        Font.system(size: min(size.height,size.width)*Constants.scale)
    }
    
    private struct Constants{
        static let cornerRadius:CGFloat = 20
        static let lineWidth:CGFloat = 3
        static let scale:CGFloat = 0.9
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(isFaceUp:true,isMatched:false,content: "🚓", id: 2))
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
