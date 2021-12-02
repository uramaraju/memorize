//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent:Hashable{
    
    struct Card:Identifiable{
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        let content:CardContent
        let id: Int
        var seenCount:Int = 0
    }
    
    struct GameTheme{
        let color:Color
        let name:String
        let emojis:[CardContent]
        let cardsCount:Int
    }
    
    let theme:GameTheme
    var cards:Array<Card>
    var color:Color {theme.color}
    
    private var lastFaceUpIndex:Int?{
        get{cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly}
        set{cards.indices.forEach{cards[$0].isFaceUp = newValue == $0}}
    }
    
    var score:Int = 0
    
    mutating func chooseCard(_ card:Card){
        if let index = cards.firstIndex(where: {$0.id == card.id}),
           !cards[index].isFaceUp,
           !cards[index].isMatched
        {
        if let lastIndex = lastFaceUpIndex {
            if (cards[lastIndex].content == cards[index].content){
                cards[lastIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
            } else{
                if (cards[lastIndex].seenCount>1){
                    score -= 1
                }
                if (cards[index].seenCount >= 1){
                    score -= 1
                }
            }
            cards[index].isFaceUp = true
        }
        else{
            lastFaceUpIndex = index
        }
        cards[index].seenCount = cards[index].seenCount + 1;
        }
        
    }
    
    init(theme:GameTheme){
        self.theme = theme
        let shuffled = theme.emojis.reduce(into: Set<CardContent>()){
            $0.insert($1)
        }.shuffled()
        
        cards = []
        for pairIndex in 0..<min(theme.cardsCount,shuffled.count) {
            let content = shuffled[pairIndex]
            cards.append(Card(content: content, id : pairIndex*2))
            cards.append(Card(content: content, id : pairIndex*2+1))
        }
        cards.shuffle()
    }
}

extension Array{
    var oneAndOnly:Element? {
        if self.count == 1 {
            return self.first
        }
        return nil
    }
}
