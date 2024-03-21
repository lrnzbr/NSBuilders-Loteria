//
//  HeaderView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var beansInBucket:[String]
    @Binding var beansInSquare:[Int: [String]]
    @Binding var playingCards:[Card]

    func resetCards() {
        beansInBucket = ["Bean1", "Bean2", "Bean3", "Bean4", "Bean 5", "Bean6", "Bean7", "Bean8", "Bean9", "Bean10", "Bean11", "Bean12", "Bean13", "Bean14", "Bean15", "Bean16"]
        beansInSquare.removeAll()

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
                Text("Arrastra tus frijoles →")
                    .font(.caption2)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.trailing)
                ZStack {
                    Image("beans")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 80)
                    ForEach(beansInBucket, id: \.self){ bean in
                        Image("bean")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .draggable(bean)
                    }
                }
                .dropDestination(for: String.self) { droppedBeans, location in
                    //add a bean back to the bucket
                    for bean in droppedBeans{
                        beansInBucket.append(bean)
                        //remove from square
                        for square in beansInSquare.keys {
                            beansInSquare[square]?.removeAll{$0 == bean}
                        }
                    }
                    return true
                }
            }.padding()
        }
    }
}

#Preview {
    HeaderView(beansInBucket: .constant(["bean1"]), beansInSquare: .constant([1:["bean1"]]), playingCards: .constant(Array(cardStack[0...15])))
}
