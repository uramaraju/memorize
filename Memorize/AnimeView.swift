//
//  AnimeView.swift
//  Memorize
//
//  Created by Karthikeya Ramaraju on 11/22/21.
//

import SwiftUI

struct AnimeView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .hoverEffect()
        //.transformEffect(.rotated(<#T##self: CGAffineTransform##CGAffineTransform#>))
      //  .scaleEffect(animationAmount)
        .animation(.easeInOut(duration: 2), value: animationAmount-1)
    }
}

struct AnimeView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeView()
    }
}
