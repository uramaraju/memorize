//
//  EditThemeDataView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/29/21.
//

import SwiftUI

struct EditThemeDataView: View {
    @Binding var theme:ThemeData
    
    @State private var newEmoji = ""
    
    fileprivate func slider() -> some View {
          VStack{
            HStack {
                Text("Cards Count")
                Spacer()
                Text("\(Int(theme.cardsCount))")
            }
            Slider(value: $theme.cardsCount, in: 3...30, step:1.0){
                Text("Cards")
            }
            
        }
    }
    
    var body: some View {
        List{
            Section(header: Text("Theme Info")){
                TextField("Theme",text: $theme.name)
                slider()
                ColorPicker("Color",selection:$theme.color)
            }
            Section(header: Text("Emojis")){

                TextEditor(text: $theme.emojis)
            }
        }.listStyle(InsetGroupedListStyle())
    }
}
struct EditThemeDataView_Previews: PreviewProvider {
    static let game = EmojiMemoryGame()
    static var previews: some View {
        EditThemeDataView(theme: .constant(ThemeData(name: "test", emojis:"🍏🍐🍊🍋🍌🍉", color: .blue, cardsCount: 3.0)))
          //  .preferredColorScheme(.dark)
    }
}


