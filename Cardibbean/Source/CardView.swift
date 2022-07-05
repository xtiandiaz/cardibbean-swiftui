//
//  CardView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import BerilioUI
import Emerald
import SwiftUI

struct CardFace {
    
    let value: Int
    let motif: String
    let borderColor: Color?
    let backgroundColor: Color
}

struct Card {
    
    let front: CardFace
    let back: CardFace
}

extension Card {
    
    static let preview = Card(
        front: .init(
            value: 10,
            motif: "😀",
            borderColor: nil,
            backgroundColor: .rey
        ),
        back: .init(
            value: 10,
            motif: "😛",
            borderColor: .rey,
            backgroundColor: .estuco
        )
    )
}

struct CardFaceView: View {
    
    let face: CardFace
    
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

struct CardView: View {
    
    let card: Card
    
    @State var side: FlipSide = .front
    
    var body: some View {
        ZStack {
            CardFaceView(face: card.back)
                .rotation3DEffect(
                    .degrees(side == .back ? 0 : -90), axis: (x: 0, y: 1, z: 0)
                )
                .animation(
                    .easeInOut(duration: 0.1).delay(side == .back ? 0.1 : 0),
                    value: side
                )
            
            CardFaceView(face: card.front)
                .rotation3DEffect(
                    .degrees(side == .front ? 0 : 90), axis: (x: 0, y: 1, z: 0)
                )
                .animation(
                    .easeInOut(duration: 0.1).delay(side == .front ? 0.1 : 0),
                    value: side
                )
        }
        .aspectRatio(CGSize(width: 1, height: 1.25), contentMode: .fit)
        .onTapGesture {
            side.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .preview)
            .frame(width: 100)
    }
}
