//
//  DemoSpace.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 7.7.2022.
//

import Beryllium
import Emerald
import Foundation
import SwiftUI

class DemoSpace: StackSpace<DemoCard> {
}

struct DemoSpaceView: View {
    
    @ObservedObject private(set) var space: DemoSpace
    
    var body: some View {
        SpaceView(space: space) {
            DemoCardView(card: $0)
        } placeholder: {
            DemoCardFaceView.shapeView(backgroundColor: .cielo.darkened(by: 0.1))
        } highlight: {
            DemoCardFaceView.shapeView(backgroundColor: .clear, borderColor: .white)
                .transition(.opacity.animation(.easeOut(duration: 0.1)))
        }
    }
}
