//
//  ContentView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    
    
    fileprivate func Header() -> some View {
        HStack{
            Text("Memorize").font(Font(.init(.label, size: 40)))
        }
    }
    
    fileprivate func animation() -> Animation {
        return .easeOut(duration: 4.1)
    }
    
    var body: some View {
        VStack{
            Header()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 200))]){
                    ForEach(viewModel.cards) { content in
                        CardView(content: content)
                        
                            .aspectRatio(3/4, contentMode: .fit).onTapGesture {
                                withAnimation(animation()){
                                    viewModel.chooseCard(content)
                                }
                            }
                    }
                }
            }.foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        ContentView(viewModel: game)
    }
}
