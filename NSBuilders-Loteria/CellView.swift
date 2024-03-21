//
//  CellView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct CellView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("1")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                VStack {
                    Image("arbol")
                        .resizable()
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 130)
                }.clipped()
                Text("EL ÁRBOL")
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
    CellView()
}
