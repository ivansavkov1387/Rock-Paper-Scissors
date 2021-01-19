//
//  Sign.swift
//  Rock, Paper, Scissors
//
//  Created by Иван on 1/14/21.
//

import Foundation
import GameplayKit

let randomChoise = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoise.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    func getResult(for oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors): return .draw
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper): return .win
        default: return .lose
        }
//        switch self {
//        case .rock:
//            switch oposite {
//            case .rock: return .draw
//            case .paper: return .lose
//            case .scissors: return .win
//            }
//        case .paper:
//            switch oposite {
//            case .rock: return .win
//            case .paper: return .draw
//            case .scissors: return .lose
//            }
//        case .scissors:
//            switch oposite {
//            case .rock: return .lose
//            case .paper: return .win
//            case .scissors: return .draw
//            }
//        }
    }
    
    var emoji: String {
        switch self {
        case .paper: return "👋"
        case .rock: return "👊"
        case .scissors: return "✌️"
        }
    }
}
