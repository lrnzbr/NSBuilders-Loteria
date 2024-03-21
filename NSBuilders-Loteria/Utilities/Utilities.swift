//
//  Utilities.swift
//  NSBuilders-Loteria
//
//  Created by Lorenzo Brown on 3/20/24.
//

func createPlayingCard(sampleCards: [Card], numberOfCards:Int = 16)->[Card] {
    guard sampleCards.count >= numberOfCards else {
        return []
    }
    var output:Set = [sampleCards.randomElement()!]
    
    while output.count < numberOfCards {
        output.insert(sampleCards.randomElement()!)
    }

    let outputArray =  Array(output)
    return outputArray
    }
