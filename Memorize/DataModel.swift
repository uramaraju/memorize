//
//  DataModel.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/23/21.
//

import Foundation

enum EmojiTheme:String,CaseIterable, Hashable{
    case sports, food,travel
}

class Data{
    private static let travelEmojis = ["✈️","🛵","🛳","🚙",
                               "🚟","🚎","🚅","🚁",
                               "🛶","🚤","🛥" ,"🏎",
                               "🚂","🚑","🚈","🚡",
                               "🚀","🚲","🏍","🛺",
                               "🚚","🚜","🦽","🛴",
                               "🦼","🚍","🚖","🛸",
                               "🚓","🚗","🦯","🚊"]
    
    private static let sportsEmojis = ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🥏","🎱",
                               "🪀","🏓","🏸","🏒","🏑","🥍","🏏","🪃","🥅",
                               "⛳️","🪁","🏹","🎣","🤿","🥊","🥋","🎽","🛹",
                               "🛼","🛷","⛸","🥌","⛷","🏋🏽","🤼‍♀️","🤸🏼‍♀️","🏇🏼",
                               "🏄‍♀️","🏊🏻‍♀️","🧗🏼‍♀️","🚴🏼‍♀️","🧘"]
    
    private static let foodEmojis = ["🍏","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑",
                             "🥭","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥬","🥒","🌶","🫑",
                             "🌽","🥕","🫒","🧄","🧅","🥔","🍠","🥐","🥯","🍞","🥖","🧀",
                             "🥚","🥓","🥩","🍗","🍖","🍔","🍟","🍕","🥙","🌮","🌯","🫔",
                             "🥗","🫕","🍝","🍜","🍛","🥟","🦪","🍤"]
    
    
    static let themeEmojis:Dictionary<EmojiTheme,[String]> = [.food:foodEmojis,
                                                                    .travel:travelEmojis,
                                                                    .sports:sportsEmojis]
    static let themeImages:Dictionary<EmojiTheme,String> = [.food:"leaf",
                                                                .travel:"car",
                                                                .sports:"heart"]
}

extension EmojiTheme{
    func Emojis() -> [String] {
        Data.themeEmojis[self]!.shuffled()
    }
    
    func systemImageName() -> String{
        Data.themeImages[self]!
    }
}




