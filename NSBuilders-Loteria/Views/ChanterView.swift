//
//  ChanterView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI
import AVFoundation

var synthesizer = AVSpeechSynthesizer()

struct ChanterView: View {
    let fullDeck: Set<Card> = Set(cardStack)
    @State var usedDeck = [Card]()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    func drawNewCard(){
        let newCard = fullDeck.randomElement()
        if let newCard = newCard {
            if usedDeck.contains(newCard){
                return drawNewCard()
            } else {
                usedDeck.append(newCard)
                let utterance = AVSpeechUtterance(string: newCard.title)
                utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
                synthesizer.speak(utterance)            }
        }
    }
    
    var body: some View {
        VStack {
            if let currentCard = usedDeck.last {
                Text("Carta Actual")
                CellView(beans: [], card: currentCard)
            }
            if usedDeck.count > 0 {
                HStack {
                    Text("Historial")
                    Spacer()
                }
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(usedDeck.reversed()) { card in
                        CellView(beans: [], card: card)
                            .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 3 : 5 , spacing: 12)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0: 0.1)
                                    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                                 y: phase.isIdentity ? 1.0 : 0.3)
                                    .offset(y: phase.isIdentity ? 0 : 50)
                            }
                    }
                }.scrollTargetLayout()
            }.contentMargins(16, for: .scrollContent)
                .scrollTargetBehavior(.viewAligned)
            Button("Sacar Carta"){
                drawNewCard()
            }.disabled(usedDeck.count >= fullDeck.count)
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                .foregroundColor(.white)
        }
    }
}


#Preview {
    ChanterView()
}
