//
//  DemoCardFaceView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 8.7.2022.
//

import Emerald
import Foundation
import SwiftUI

struct DemoCardFaceView: FlatTokenFaceView {
    
    let face: DemoCardFace
    
    var body: some View {
        ZStack {
            Self.shapeView(backgroundColor: face.backgroundColor, borderColor: face.borderColor)
            
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
}

extension DemoCardFaceView {
    
    static let cornerRadius: CGFloat = 8
    
    static func shapeView(backgroundColor: Color, borderColor: Color? = nil) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
            .fill(backgroundColor)
            .overlay {
                if let borderColor = borderColor {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .circular)
                        .strokeBorder(borderColor, lineWidth: 4)
                }
            }
    }
}
