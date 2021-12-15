//
//  ContentView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI
typealias Card = MemoryGame<String>.Card

struct EmojiMemoryGameView: View {
    @State var isAdding:Bool = false
    @ObservedObject var game:EmojiMemoryGame
    @State var themeData = ThemeData( name: "", emojis: "", color: .red, cardsCount: 3.0)
    fileprivate func Header() -> some View {
        HStack{
            Text("Memorize \(game.name)").font(Font(.init(.label, size: 40)))
        }
    }
    
    fileprivate func scoreView() -> some View {
        return VStack{
            HStack{
                if (game.score < 0){
                    Image(systemName: "minus.circle").font(.footnote).padding(/*@START_MENU_TOKEN@*/.horizontal, -7.0/*@END_MENU_TOKEN@*/)
                }
                Image(systemName: "\(abs(game.score)).circle").badge(2).font(.largeTitle).foregroundColor(game.score > 0 ? Color.green:Color.red)
            }
            
            Text("score").font(.footnote)
        }
    }
    
    fileprivate func Footer() -> some View {
        HStack(alignment:.center){
            newThemeButton()
            Spacer()
            scoreView()
            Spacer();
            startAgain()
        }.padding()
    }
    
    private func newThemeButton() -> some View {
        Button(action: {
            isAdding = true
        },label:{
            VStack{
                Image(systemName: "plus.circle").font(.largeTitle)
                Text("new theme").font(.footnote)
            }
            .padding(.all)
        }).sheet(isPresented: $isAdding, onDismiss: {isAdding = false}, content: {
            NavigationView{
                EditThemeDataView(theme: $themeData) .navigationBarItems(leading: Button("Dismiss") {
                    isAdding = false
                }, trailing: Button("Add"){
                    isAdding = false
                    let emojis = Array(themeData.emojis).map{String($0)}
                    game.addGameTheme(name: themeData.name, color: themeData.color, emojis: emojis, cardsCount:Int(themeData.cardsCount))
                })
            }
        })
    }
    
    fileprivate func animation() -> Animation {
        return .easeOut(duration: 4.1)
    }
    
    private func startAgain() -> some View {
        Button(action: {
            game.newGame()
        },label:{
            VStack{
                Image(systemName: "shuffle.circle").font(.largeTitle)
                Text("start over").font(.footnote)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        })
    }
    
    var body: some View {
        
        VStack{
            Header()
            AspectVGrid(items: game.cards,aspectRatio: 2/3,content: {
                createCard(card: $0)
                //.background(game.color)
            }).foregroundColor(game.color)
            
            Footer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func createCard(card:Card) -> some View{
        if (card.isMatched && !card.isFaceUp)   {
            Rectangle().opacity(0)
        } else{
            CardView(card:card).onTapGesture {
                withAnimation(animation()){
                    game.chooseCard(card)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    // game.cards[0].isFaceUp = true
    static var previews: some View {
        
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
