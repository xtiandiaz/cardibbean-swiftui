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
        super.init(spaces: [DemoSpace(), DemoSpace()])
    }
}
