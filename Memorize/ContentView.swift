//
//  ContentView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI
struct ContentView: View {
    
    @State private var selectedType = EmojiTheme.travel
    @State var emojis:[String] = EmojiTheme.travel.Emojis()
    @State var emojiCount = 11
    
    private func ThemeSelectorView(_ emoji: EmojiTheme) -> some View {
        Button(action: {
            selectedType = emoji
            emojis = emoji.Emojis()
        },label:{
            VStack{
                Image(systemName: emoji.systemImageName()).font(.largeTitle)
                Text(emoji.rawValue).font(.footnote)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }).disabled(emoji == selectedType)
    }
    
    fileprivate func footerView() -> some View {
        HStack(alignment: .center){
            Spacer()
            ForEach(EmojiTheme.allCases, id: \.self){
                emoji in
                ThemeSelectorView(emoji)
                Spacer()
            }
        }
    }
    
    fileprivate func Header() -> some View {
        HStack{
            Text("Memorize").font(Font(.init(.label, size: 40)))
        }
    }
    
    var body: some View {
        VStack{
            Header()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 200))]){
                    ForEach(emojis[0..<emojiCount],id : \.self) { content in
                        CardView(content: content, isFaceUp: true)
                            .aspectRatio(3/4, contentMode: .fit)
                    }
                }
            }.foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
            footerView()
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
