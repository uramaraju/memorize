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
    var body: some View {
        List{
            Section(header: Text("Theme Info")){
                TextField("Title",text: $theme.name)
                HStack{
                    Text("Cards Count")
                    Slider(value: $theme.cardsCount, in: 3...30, step:1.0){
                        Text("Cards")
                    }
                    Spacer()
                    Text("\(Int(theme.cardsCount))")
                }
                ColorPicker("Color",selection:$theme.color)
            }
            Section(header: Text("Emojis")){

                TextEditor(text: $theme.emojis)
            }
        }.listStyle(InsetGroupedListStyle())
    }
}


