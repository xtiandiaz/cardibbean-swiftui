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

class DemoBoard: Board<DemoCard, DemoSpace> {
    
    init() {
        super.init(spaces: (0..<3).map { _ in Self.space() })
    }
    
    // MARK: - Private
    
    private static func space() -> DemoSpace {
        DemoSpace(
            layout: .init {
                CGSize(height: .s * $0.index)
            },
            styling: .init {
                -0.25 * $0.layout.index / $0.count
            }
        )
    }
}
