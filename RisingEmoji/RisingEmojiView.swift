//
//  RisingEmojiView.swift
//  RisingEmoji
//
//  Created by 藤治仁 on 2023/05/03.
//

import SwiftUI

struct RisingEmojiView: View {
    let emoji: String
    @State private var xPosition: CGFloat = 0
    @State private var isRising = false

    var body: some View {
        Text(emoji)
            .font(.system(size: 30))
            .offset(x: xPosition, y: isRising ? -(UIScreen.main.bounds.height + 60) : 30)
            .onAppear {
                xPosition = randomXPosition()
                withAnimation(Animation.linear(duration: randomDuration()).repeatForever(autoreverses: false)) {
                    isRising.toggle()
                }
            }
    }
    
    private func randomXPosition() -> CGFloat {
        CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)))
    }
    
    private func randomDuration() -> Double {
        Double(arc4random_uniform(4) + 2)
    }
}

struct RisingEmojiView_Previews: PreviewProvider {
    static var previews: some View {
        RisingEmojiView(emoji: "😊")
    }
}
