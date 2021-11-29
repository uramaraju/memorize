//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import Foundation
import CloudKit

struct MemoryGame<CardContent> where CardContent:Equatable{
    
    struct Card:Identifiable{
        var isFaceUp:Bool = false
        var isMatched:Bool = false
        var content:CardContent
        var id: Int
    
    }
    
    var cards:Array<Card>
    private var lastFaceUpIndex:Int?
//    mutating func chooseCard(_ card:Card){
//        let index = cards.firstIndex{$0.id == card.id}
//        if let index = index {
//            if (!cards[index].isMatched) {
//                cards[index].isFaceUp.toggle()
//            }
//            if let match = cards.firstIndex(where: {$0.content == card.content && $0.id != card.id && $0.isFaceUp}){
//                cards[index].isMatched = true
//                cards[match].isMatched = true
//            }
//            if let unmatch = cards.firstIndex(where: {$0.id != card.id && $0.isFaceUp && !$0.isMatched}){
//               // cards[index].isMatched = true
//                cards[unmatch].isFaceUp = false
//            }
//
//        }
//    }
    // official solution  with one showing

//    mutating fileprivate func checkMatch(_ lastIndex: Int, _ index: Array<MemoryGame<CardContent>.Card>.Index) {
//        if (cards[lastIndex].content == cards[index].content){
//            cards[lastIndex].isMatched = true
//            cards[index].isMatched = true
//            lastFaceUpIndex = nil
//        } else {
//            cards[lastIndex].isFaceUp = false
//            lastFaceUpIndex = index
//        }
//    }
//
//    mutating func chooseCard2(_ card:Card){
//        if let index = cards.firstIndex(where: {$0.id == card.id}), !cards[index].isFaceUp, !cards[index].isMatched {
//                if let lastIndex = lastFaceUpIndex {
//                    checkMatch(lastIndex, index)
//                }
//                else{
//                    lastFaceUpIndex = index
//                }
//                cards[index].isFaceUp.toggle()
//            }
//
//    }
    mutating func chooseCard(_ card:Card){
        if let index = cards.firstIndex(where: {$0.id == card.id}),
            !cards[index].isFaceUp,
            !cards[index].isMatched
        {
                if let lastIndex = lastFaceUpIndex {
                    if (cards[lastIndex].content == cards[index].content){
                        cards[lastIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    lastFaceUpIndex = nil
                }
                else{
                    for item in cards.indices {
                        cards[item].isFaceUp = false
                    }
                    lastFaceUpIndex = index
                }
                cards[index].isFaceUp.toggle()
            }
        
    }
    
    init(numberOfPairsOfCards:Int, createCard: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCard(pairIndex)
            cards.append(Card(content: content, id : pairIndex*2))
            cards.append(Card(content: content, id : pairIndex*2+1))
        }
        cards.shuffle()
    }
}
