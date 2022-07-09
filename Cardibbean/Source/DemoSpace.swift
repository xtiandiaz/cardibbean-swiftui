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
        CollectionSpaceView(space: space) { index, count, token in
            DemoCardView(card: token)
                .offset(x: 0, y: .s * index)
                .zIndex(count - index)
                .brightness(-0.25 * Double(index) / count)
        } placeholder: {
            DemoCardFaceView.shapeView(backgroundColor: .black.withAlphaComponent(0.25))
                .aspectRatio(CGSize(width: 1, height: 1.25), contentMode: .fit)
        } highlight: {
            DemoCardFaceView.shapeView(backgroundColor: .clear, borderColor: .green)
                .aspectRatio(CGSize(width: 1, height: 1.25), contentMode: .fit)
                .transition(.opacity)
        }
        .frame(width: 100)
    }
}
