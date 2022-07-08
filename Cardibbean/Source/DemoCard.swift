//
//  DemoCard.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import BerilioUI
import Emerald
import SwiftUI

class DemoCard: Card {
    
    @Published var side: FlipSide = .front
    
    let id = UUID()
    let front: DemoCardFace
    let back: DemoCardFace
    
    init(front: DemoCardFace, back: DemoCardFace) {
        self.front = front
        self.back = back
    }
    
    func canInteract(with other: DemoCard) -> Bool {
        false
    }
    
    func interact(with other: DemoCard) {
    }
}

extension DemoCard {
    
    static func create(for type: CardType) -> DemoCard {
        switch type {
        default:
            return DemoCard(
                front: type.face(for: .front),
                back: type.face(for: .back)
            )
        }
    }
}
