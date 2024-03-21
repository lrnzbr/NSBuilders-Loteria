//
//  GameModeView.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

import SwiftUI

struct GameModeView: View {
    var body: some View {
        Text("Lotería")
        NavigationView{
            List {
                NavigationLink(destination: ChanterView()){
                    Text("Cantar")
                }
                NavigationLink(destination: PlayView()){
                    Text("Jugar")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    GameModeView()
}
