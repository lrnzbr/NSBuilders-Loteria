//
//  HeaderView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var playingCards:[Card]

    func resetCards() {
        playingCards = createPlayingCard(sampleCards: cardStack)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button("Crear Nueva Carta"){
                    resetCards()
                }.padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .clipShape(Capsule())
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    HeaderView(playingCards: .constant(Array(cardStack[0...15])))
}
