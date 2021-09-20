//
//  Symbol.swift
//  NoughtsAndCrosses
//
//  Created by Антон Бобрышев on 19.09.2021.
//

import Foundation

enum Symbol {
    case Cross
    case Nought
}

enum GameType {
    case pvp
    case pve
}

enum Players: String {
    case playerOne = "👨🏻‍🚒"
    case playerTwo = "👷🏼‍♂️"
    case aiPlayer = "🤖"
}
