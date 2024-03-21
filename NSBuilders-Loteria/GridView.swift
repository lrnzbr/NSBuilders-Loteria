//
//  GridView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct GridView: View {
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
                        CellView(card: playingCards[number])
                            .frame(maxWidth: geo.size.width / 4, maxHeight: geo.size.height / 4)
                    }
                }
            }.padding(.bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}

#Preview {
    GridView(playingCards: .constant(Array(cardStack[0...15])))
}
