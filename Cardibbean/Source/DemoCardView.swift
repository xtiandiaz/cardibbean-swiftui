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
        FlatTokenView(token: card) {
            DemoCardFaceView(face: $0)
        } back: {
            DemoCardFaceView(face: $0!)
        }
        .aspectRatio(CGSize(width: 1, height: 1.25), contentMode: .fit)
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
