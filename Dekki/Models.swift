//
//  Models.swift
//  Dekki
//
//  Created by Alpha on 3/28/20.
//  Copyright © 2020 Arbitrary Definitions. All rights reserved.
//

import Foundation

class Deck {
    
    private var cards: [Card] = {
        var cards = Rank.allCases.flatMap { rank in
            Suit.allCases.map { suit in
                Card(rank: rank, suit: suit)
            }
        }
        cards.shuffle()
        return cards
    }()
    
    func deal() -> Card? {
        guard let card = cards.popLast() else { return nil }
        
        return card
    }
}

struct Card {
    let rank: Rank
    let suit: Suit
}

enum Rank: Int, CaseIterable {
    case ace = 1, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
}

enum Suit: Int, CaseIterable, CustomStringConvertible {
    case clubs = 0, diamonds, hearts, spades
    
    var description: String {
        switch self {
        case .clubs: return "♣️"
        case .diamonds: return "♦️"
        case .hearts: return "♥️"
        case .spades: return "♠️"
        }
    }
}
