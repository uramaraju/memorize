//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame();
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
