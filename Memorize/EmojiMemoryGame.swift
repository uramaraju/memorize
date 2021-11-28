//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import SwiftUI

// to be reference
class EmojiMemoryGame{
    private static let foodEmojis = ["🍏","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑",
                                     "🥭","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶","🫑",
                                     "🌽","🥕","🫒","🧄","🧅","🥔","🍠","🥐","🥯","🍞","🥖","🧀",
                                     "🥚","🥓","🥩","🍗","🍖","🍔","🍟","🍕","🥙","🌮","🌯","🫔",
                                     "🥗","🫕","🍝","🍜","🍛","🥟","🦪","🍤"]
    
    private static func createMemoryGame()-> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8)
        {index in foodEmojis[index]}
    }
    private(set) var model:MemoryGame<String> = createMemoryGame()
    
    
}
