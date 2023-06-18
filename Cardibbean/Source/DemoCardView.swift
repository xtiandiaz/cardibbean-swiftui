//
//  DemoCardView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 8.7.2022.
//

import Beryllium
import Emerald
import Foundation
import SwiftUI

struct DemoCardView: View {
    
    let card: DemoCard
    
    init(card: DemoCard) {
        self.card = card
    }
    
    var body: some View {
        UIFlatTokenView(token: card) {
            DemoCardFaceView(face: $0)
        } back: {
            DemoCardFaceView(face: $0!)
        }
        .onTapGesture {
            card.side.toggle()
        }
    }
}

struct DemoCardView_Previews: PreviewProvider {
    static var previews: some View {
        DemoCardView(card: .create(for: .player))
            .frame(width: 100)
    }
}
