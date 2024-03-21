//
//  ChanterView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct ChanterView: View {
    let fullDeck: Set<Card> = Set(cardStack)
    @State var usedDeck = [Card]()
    
    func drawNewCard(){
        let newCard = fullDeck.randomElement()
        if let newCard = newCard {
            if usedDeck.contains(newCard){
                return drawNewCard()
            } else {
                usedDeck.append(newCard)
            }
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
                        
                    }
                }
            }
        }
        
        Button("Sacar Carta"){
            drawNewCard()
        }.disabled(usedDeck.count >= fullDeck.count)
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}


#Preview {
    ChanterView()
}
