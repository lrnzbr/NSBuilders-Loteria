//
//  PlayView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct PlayView: View {
    @State var playingCards:[Card] = createPlayingCard(sampleCards: cardStack)
    
    var body: some View {
        VStack {
            HeaderView(playingCards: $playingCards)
            GridView(playingCards: $playingCards)
        }
    }
}

#Preview {
    PlayView()
}
