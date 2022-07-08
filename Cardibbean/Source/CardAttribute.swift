//
//  CardAttribute.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 4.7.2022.
//  Copyright © 2022 Berilio. All rights reserved.
//

import Foundation

struct CardAttribute: OptionSet {
    
    static let healing = CardAttribute(rawValue: 1 << 0)
    
    let rawValue: Int
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension CardAttribute {
    
    var suit: String? {
        switch self {
        case .healing: return "❤️"
        default: return nil
        }
    }
}
