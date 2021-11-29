//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import SwiftUI

// to be reference
class EmojiMemoryGame : ObservableObject{
    private static let foodEmojis = ["🍏","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑",
                                     "🥭","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶","🫑",
                                     "🌽","🥕","🫒","🧄","🧅","🥔","🍠","🥐","🥯","🍞","🥖","🧀",
                                     "🥚","🥓","🥩","🍗","🍖","🍔","🍟","🍕","🥙","🌮","🌯","🫔",
                                     "🥗","🫕","🍝","🍜","🍛","🥟","🦪","🍤"]
    
    private static func createMemoryGame()-> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5){index in foodEmojis[index]}
    }
    
    @Published private var model:MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func chooseCard(_ card:MemoryGame<String>.Card){
        model.chooseCard(card)
    }
    
}
