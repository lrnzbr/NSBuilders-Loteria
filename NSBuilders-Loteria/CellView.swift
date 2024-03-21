//
//  CellView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct CellView: View {
    let card: Card

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(card.id)")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                VStack {
                    Image(card.imageString)
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 130)
                }.clipped()
                Text(card.title)
                    .lineLimit(2)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.2)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: 200, maxHeight: 250)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1)
        )
    }
}


#Preview {
    CellView(card: cardStack[0])
}
