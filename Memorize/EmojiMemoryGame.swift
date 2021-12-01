//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/28/21.
//

import SwiftUI
typealias Theme = MemoryGame<String>.GameTheme
// to be reference
class EmojiMemoryGame : ObservableObject{
    init(){
        let data = [Theme(color:.green,name:"Food", emojis:Data.foodEmojis,cardsCount:5),
                    Theme(color:.red, name:"Sports", emojis: Data.sportsEmojis,cardsCount:4),
                    Theme(color:.yellow,name:"Travel", emojis:Data.travelEmojis,cardsCount:6),
                    Theme(color:.orange,name:"Fewer", emojis:Data.fewerThanSelected,cardsCount:6),
                    Theme(color:.purple,name:"Repeat", emojis:Data.repeated,cardsCount:6)]
        game = EmojiMemoryGame.createMemoryGame(theme:data.randomElement()!)
        themes = data
        
    }
    
    private static func createMemoryGame(theme:Theme)-> MemoryGame<String> {
        return MemoryGame<String>(theme:theme)
    }
    
    @Published private var themes:Array<Theme>
    
    @Published private var game:MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    var color:Color {
        game.color
    }
    var score:Int {
        game.score
    }
    var name:String{
        game.theme.name
    }
    //MARK: - intent - chooseCard
    func chooseCard(_ card:MemoryGame<String>.Card){
        game.chooseCard(card)
    }
    
    func addGameTheme(name:String,color:Color,emojis:[String], cardsCount: Int) {
        themes.append(Theme(color:color,name:name,emojis:emojis,cardsCount: cardsCount))
    }
    
    func newGame(){
        game = EmojiMemoryGame.createMemoryGame(theme:themes.randomElement()!)
    }
    
}

struct ThemeData{
    var name:String
    var emojis:String
    var color:Color
    var cardsCount:Double
}

