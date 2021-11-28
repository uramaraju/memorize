//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import Foundation

struct MemoryGame<CardContent>{
    
    struct Card{
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
    }
    
    var cards:Array<Card>
    
    func chooseCard(_ card:Card){
        
    }
    
    init(numberOfPairsOfCards:Int, createCard: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCard(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
       
        }
    }
}
