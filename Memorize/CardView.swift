//
//  CardView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/21/21.
//

import SwiftUI

struct CardView: View {
    let content:String
    @State var isFaceUp:Bool = true
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 2)
                Text(content).font(.title)
            }else {
                shape.fill()
            }
        }
        .onTapGesture {
            withAnimation(.spring()){
                isFaceUp.toggle()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🥝")
    }
}
