//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Anwar Hajji on 06/07/2022.
//

import Foundation
import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    static let vehiclesEmoji = ["🚕", "🚞", "🚁", "🛳","🚠", "🛵", "🚐", "🛶","🛴", "🏎", "🚌", "🚔","🚂", "⛵️", "🚀", "🚤"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPaireOfCards: 4) { pairIndex in
            vehiclesEmoji[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
