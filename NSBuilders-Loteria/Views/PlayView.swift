//
//  PlayView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct PlayView: View {
    @State private var beansInBucket:[String] = ["Bean1", "Bean2", "Bean3", "Bean4", "Bean 5", "Bean6", "Bean7", "Bean8", "Bean9", "Bean10", "Bean11", "Bean12", "Bean13", "Bean14", "Bean15", "Bean16"]
    @State private var beansInSquare: [Int: [String]] = [:]
    @State var playingCards:[Card] = createPlayingCard(sampleCards: cardStack)
    
    var body: some View {
        VStack {
            HeaderView(beansInBucket: $beansInBucket, beansInSquare: $beansInSquare, playingCards: $playingCards)
            GridView(beansInBucket: $beansInBucket, beansInSquare: $beansInSquare, playingCards: $playingCards)
        }
    }
}

#Preview {
    PlayView()
}
