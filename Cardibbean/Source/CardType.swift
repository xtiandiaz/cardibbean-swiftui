//
//  CardType.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 8.7.2022.
//

import Emerald
import Foundation
import SwiftUI

enum Weapon: Int, CaseIterable {
    
    case dagger,
         broadsword,
         claymore
    
    var color: Color {
        .black
    }
    
    var value: Int {
        switch self {
        case .dagger: return 3
        case .broadsword: return 6
        case .claymore: return 9
        }
    }
    
    var suit: String {
        "⚔️"
    }
    
    var motif: String {
        switch self {
        case .dagger: return "🗡"
        case .broadsword: return "⚔️"
        case .claymore: return "⚔️"
        }
    }
}

enum Ammo: Int, CaseIterable {
    
    case cannonball
    
    var color: Color {
        .black
    }
    
    var suit: String {
        "🔥"
    }
    
    var motif: String {
        switch self {
        case .cannonball: return "💣"
        }
    }
}

enum Monster: Int, CaseIterable {
    
    case kraken,
         octoplus,
         crabula
    
    var value: Int {
        switch self {
        case .kraken: return 9
        case .octoplus: return 6
        case .crabula: return 3
        }
    }
    
    var suit: String {
        "💀"
    }
    
    var motif: String {
        switch self {
        case .kraken: return "🦑"
        case .octoplus: return "🐙"
        case .crabula: return "🦀"
        }
    }
}

enum MonsterPart: Int, CaseIterable {
    
    case guts,
         heart,
         claw,
         fang,
         tentacle,
         tongue
    
    var value: Int {
        .randomCardValue()
    }
    
    var suit: String? {
        attributes.suit
    }
    
    var motif: String {
        switch self {
        case .guts: return "🪢"
        case .heart: return "🫀"
        case .claw: return "💧"
        case .fang: return "🦷"
        case .tentacle: return "🪱"
        case .tongue: return "👅"
        }
    }
    
    var attributes: CardAttribute {
        switch self {
        case .guts, .heart, .tentacle, .tongue:
            return [.healing]
        default:
            return []
        }
    }
    
    static func random() -> MonsterPart {
        allCases.randomElement()!
    }
}

enum Resource: Equatable {
    
    case food,
         ammo(Ammo)
    
    var value: Int {
        switch self {
        case .food: return .randomCardValue()
        case .ammo: return .randomCardValue()
        }
    }
    
    var color: Color {
        switch self {
        case .food: return .lipstick
        case .ammo: return .crudo
        }
    }
    
    var suit: String {
        switch self {
        case .food: return "❤️"
        case .ammo: return "🔥"
        }
    }
    
    var motif: String {
        switch self {
        case .food: return ["🍖", "🍗", "🍣", "🥪", "🍜"].randomElement()!
        case .ammo(let ammo): return ammo.motif
        }
    }
}

enum Device: Int, CaseIterable {
    
    case cannon, crane
    
    var suit: String {
        "⚙️"
    }
    
    var motif: String {
        switch self {
        case .cannon: return "💣"
        case .crane: return "🪝"
        }
    }
}

enum Ship: Equatable {
    
    case player,
         pirate(Pirate),
         merchant
    
    var suit: String? {
        switch self {
        case .player: return nil
        case .pirate(let pirate): return pirate.suit
        case .merchant: return "📦"
        }
    }
    
    var motif: String {
        switch self {
        case .player: return "🛳"
        case .pirate: return "🏴‍☠️"
        case .merchant: return "⛴"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .player: return .limoncello
        case .pirate(let pirate): return pirate.backgroundColor
        case .merchant: return .rey
        }
    }
}

enum Pirate: Int {
    
    case minion,
         lieutenant,
         captain
    
    var value: Int {
        switch self {
        case .minion: return 3
        case .lieutenant: return 6
        case .captain: return 9
        }
    }
    
    var suit: String {
        "💀"
    }
    
    var backgroundColor: Color {
        .segway
    }
}

enum CardType: Equatable {
    
    case player,
         
         crate,
         resource(Resource),
         weapon(Weapon),
         
         device(Device),
         
         monster(Monster),
         monsterPart(MonsterPart),
         
         ship(Ship),
         
         pirate(Pirate),
         merchant
    
    var value: Int {
        switch self {
        case .player: return 10
        case .weapon(let weapon): return weapon.value
        case .ship(let ship):
            switch ship {
            case .player: return CardType.player.value
            case .pirate(let pirate): return pirate.value
            case .merchant: return 3
            }
        case .pirate(let pirate): return pirate.value
        default: return Int.randomCardValue()
        }
    }
    
    var motif: String {
        switch self {
        case .player: return ["🧔🏽", "🧔", "🧔🏻", "🧔🏾", "🧔🏿"].randomElement()!
        case .crate: return "📦"
        case .resource(let resource): return resource.motif
        case .weapon(let weapon): return weapon.motif
        case .device(let device): return device.motif
        case .monster(let monster): return monster.motif
        case .monsterPart(let part): return part.motif
        case .ship(let ship): return ship.motif
        case .pirate: return "☠️"
        case .merchant: return ["👩🏻‍🦰", "👩🏽", "👩🏻", "👩🏼", "👩🏾‍🦳"].randomElement()!
        }
    }
    
    var suit: String? {
        switch self {
        case .crate, .merchant: return "📦"
        case .pirate, .monster: return "💀"
        case .ship(let ship): return ship.suit
        case .resource(let resource): return resource.suit
        case .weapon(let weapon): return weapon.suit
        case .monsterPart(let part): return part.suit
        default: return nil
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .resource(let resource): return resource.color
        default: return backgroundColor.body
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .player: return .limoncello
        case .crate: return .cielo
        case .resource, .weapon, .monsterPart: return .estuco
        case .device: return .tangelo
        case .monster: return .purpolo
        case .ship(let ship): return ship.backgroundColor
        case .pirate(let pirate): return pirate.backgroundColor
        case .merchant: return .rey
        }
    }
    
    var borderColor: Color? {
        switch self {
        case .weapon: return .quartz
        case .monsterPart: return .purpolo
        case .resource(let resource):
            switch resource {
            case .ammo: return .tangelo
            case .food: return .lipstick
            }
        default: return nil
        }
    }
    
    func face(for side: FlatTokenSide) -> DemoCardFace {
        DemoCardFace(
            side: side,
            type: self,
            value: value,
            motif: motif,
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            suit: suit,
            borderColor: borderColor
        )
    }
    
    // MARK: - Private
    
    private var showsValue: Bool {
        switch self {
        case .crate: return false
        default: return true
        }
    }
}

extension CardType {
    
    var isPlayer: Bool {
        self == .player
    }
    
    var isResource: Bool {
        switch self {
        case .resource: return true
        default: return false
        }
    }
    
    var isFood: Bool {
        self == .resource(.food)
    }
    
    var isWeapon: Bool {
        switch self {
        case .weapon: return true
        default: return false
        }
    }
    
    var isDevice: Bool {
        switch self {
        case .device: return true
        default: return false
        }
    }
    
    var isPirate: Bool {
        switch self {
        case .pirate: return true
        default: return false
        }
    }
    
    var isFoe: Bool {
        switch self {
        case .pirate, .monster: return true
        default: return false
        }
    }
    
    var isMerchant: Bool {
        switch self {
        case .merchant: return true
        default: return false
        }
    }
    
    var isMonsterPart: Bool {
        switch self {
        case .monsterPart: return true
        default: return false
        }
    }
}

private extension Int {
    
    static func randomCardValue() -> Int {
        Array(stride(from: 3, through: 9, by: 3)).randomElement()!
    }
}

