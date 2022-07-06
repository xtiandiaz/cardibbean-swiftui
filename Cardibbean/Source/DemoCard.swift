//
//  DemoCard.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import BerilioUI
import Emerald
import SwiftUI

enum DemoCardType {
    
    case player
}

struct DemoCardFace: CardFace {
    
    let type: DemoCardType
    let value: Int
    let motif: String
    let backgroundColor: Color
    let borderColor: Color?
}

struct DemoCard: Card {
    
    let front: DemoCardFace
    let back: DemoCardFace
    
    func canInteract(with other: DemoCard) -> Bool {
        false
    }
    
    func interact(with other: DemoCard) {
    }
}

extension DemoCard {
    
    static let preview = DemoCard(
        front: .init(
            type: .player,
            value: 10,
            motif: "😀",
            backgroundColor: .rey,
            borderColor: nil
        ),
        back: .init(
            type: .player,
            value: 10,
            motif: "😛",
            backgroundColor: .estuco,
            borderColor: .rey
        )
    )
}

struct DemoCardFaceView: CardFaceView  {
    
    let face: DemoCardFace
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                .fill(face.backgroundColor)
                .overlay {
                    if let borderColor = face.borderColor {
                        RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                            .strokeBorder(borderColor, lineWidth: 4)
                    }
                }
            
            Text("\(face.value)")
                .font(.title, weight: .bold)
                .foregroundColor(face.borderColor ?? face.backgroundColor.accessibleFontColor)
                .padding(EdgeInsets(top: .xs, leading: 0, bottom: 0, trailing: .s))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            Text(face.motif)
                .font(.system(size: .xxl))
                .offset(y: .s)
        }
    }
    
    // MARK: - Private
    
    private let cornerRadius: CGFloat = 8
}

struct DemoCardView: CardView {
    
    let card: DemoCard
    
    @State var side: FlipSide = .front
    
    var aspectRatio: CGSize {
        CGSize(width: 1, height: 1.25)
    }
    
    var body: some View {
        ZStack {
            DemoCardFaceView(face: card.back)
                .rotation3DEffect(
                    .degrees(side == .back ? 0 : -90), axis: (x: 0, y: 1, z: 0)
                )
                .animation(
                    .easeInOut(duration: 0.1).delay(side == .back ? 0.1 : 0),
                    value: side
                )
            
            DemoCardFaceView(face: card.front)
                .rotation3DEffect(
                    .degrees(side == .front ? 0 : 90), axis: (x: 0, y: 1, z: 0)
                )
                .animation(
                    .easeInOut(duration: 0.1).delay(side == .front ? 0.1 : 0),
                    value: side
                )
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .onTapGesture {
            side.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        DemoCardView(card: .preview)
            .frame(width: 100)
    }
}
