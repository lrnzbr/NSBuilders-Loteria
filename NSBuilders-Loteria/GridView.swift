//
//  GridView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct GridView: View {
    @Binding var beansInBucket:[String]
    @Binding var beansInSquare:[Int: [String]]
    @Binding var playingCards:[Card]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LazyVGrid(columns: columns)
                {
                    ForEach(0...15, id: \.self) { number in
                        CellView(beans: beansInSquare[number] ?? [], card: playingCards[number])
                            .frame(maxWidth: geo.size.width / 4, maxHeight: geo.size.height / 4)
                            .dropDestination(for: String.self) { droppedBeans, location in
                                // remove from bucket
                                for bean in droppedBeans {
                                    beansInBucket.removeAll {$0 == bean}
                                    //remove drag from other squares
                                    for square in beansInSquare.keys {
                                        beansInSquare[square]?.removeAll{$0 == bean}
                                    }
                                }
                                //add to square
                                var currentBeans = beansInSquare[number]
                                if let firstBean = droppedBeans.first {
                                    if currentBeans != nil {
                                        currentBeans?.append(firstBean)
                                    } else {
                                        currentBeans = [firstBean]
                                    }
                                    beansInSquare[number] = currentBeans
                                }
                                return true
                                
                            }
                    }
                }
            }.padding(.bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

#Preview {
    GridView(beansInBucket: .constant(["bean1"]), beansInSquare: .constant([1:["bean1"]]), playingCards: .constant(Array(cardStack[0...15])))
}
