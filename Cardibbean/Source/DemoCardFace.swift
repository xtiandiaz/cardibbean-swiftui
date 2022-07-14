//
//  DemoCardFace.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 8.7.2022.
//

import Emerald
import Foundation
import SwiftUI

struct DemoCardFace: FlatTokenFace {
    
    let id = UUID()
    let side: FlatTokenSide
    let type: CardType
    let value: Int
    let motif: String
    let foregroundColor: Color
    let backgroundColor: Color
    let suit: String?
    let borderColor: Color?
}
