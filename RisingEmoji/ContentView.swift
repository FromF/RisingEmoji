//
//  ContentView.swift
//  RisingEmoji
//
//  Created by 藤治仁 on 2023/05/03.
//

import SwiftUI

struct ContentView: View {
    @State private var emojiCount = 1

    var body: some View {
        ZStack {
            ForEach(0..<emojiCount, id: \.self) { _ in
                RisingEmojiView(emoji: randomEmoji())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(Color.clear)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                emojiCount += 1
            }
        }
    }
    
    private func randomEmoji() -> String {
        let emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "😊", "😇"] // お好みの絵文字を追加してください
        return emojis.randomElement() ?? "😀"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
