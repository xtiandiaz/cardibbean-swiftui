//
//  DemoBoard.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 6.7.2022.
//

import Beryllium
import Emerald
import Foundation
import SwiftUI

class DemoBoard: Board {
    
    init() {
        super.init(spaces: (0..<9).map { _ in Self.space() })
    }
    
//    override func nextSpace(for token: Token, from space: AnySpace, toward direction: Direction) -> AnySpace? {
//        spaces.randomElement()!
//    }
    
    // MARK: - Private
    
    private static func space() -> DemoSpace {
        DemoSpace(
            layout: .init(tokenAspect: CGSize(width: 1, height: 1.25)) {
                CGSize(height: .s * $0.index)
            } tokenRotation: { _ in
                Angle(degrees: Double.random(in: -1.5...1.5))
            },
            styling: .init {
                -0.25 * $0.layout.index / $0.count
            }
        )
    }
}
