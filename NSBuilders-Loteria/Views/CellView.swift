//
//  CellView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct CellView: View {
    let beans: [String]
    let card: Card

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("\(card.id)")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    if beans.count > 0 {
                        HStack {
                            Spacer()
                            ForEach(beans, id: \.self){ bean in
                                VStack {
                                    Image("bean")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30)
                                }
                                .draggable(bean)
                            }
                            
                        }
                    }
                }
                VStack {
                    Image(card.imageString)
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 130)
                }.clipped()
                Text(card.title.uppercased())
                    .lineLimit(2)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(beans.count > 0 ? .green : .black)

            }
        }
        .frame(maxWidth: 200, maxHeight: 250)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(beans.count > 0 ? .green : .black, lineWidth: 1)
        )
    }
}


#Preview {
    CellView(beans: ["bean1"], card: cardStack[4])
}
