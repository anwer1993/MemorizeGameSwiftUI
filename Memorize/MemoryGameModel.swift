//
//  MemoryGame.swift
//  Memorize
//
//  Created by Anwar Hajji on 06/07/2022.
//

import Foundation


struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPaireOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPaireOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let index = index(of: card) {
            cards[index].isFaceUp.toggle() 
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
