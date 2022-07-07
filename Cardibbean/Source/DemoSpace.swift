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

struct DemoSpaceView: CollectionSpaceView {
    
    @ObservedObject private(set) var space: DemoSpace
    
    init(space: DemoSpace) {
        self.space = space
    }
    
    var body: some View {
        ZStack {
            DemoCardFaceView.shapeView(backgroundColor: .black.withAlphaComponent(0.25))
                .aspectRatio(DemoCardView.aspectRatio, contentMode: .fit)
            
            ForEach(Array(zip(space.collection.indices, space.collection)), id: \.0) { index, card in
                DemoCardView(card: card)
                    .offset(x: 0, y: .s * index)
                    .zIndex(space.collection.count - index)
                    .brightness((-Double(index) / space.collection.count) * 0.25)
            }
        }
    }
}
