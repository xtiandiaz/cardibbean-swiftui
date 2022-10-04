//
//  FontExtensions.swift
//  BerilioUIWorkshop
//
//  Created by Cristian Diaz on 27.7.2022.
//

import BerilioUI
import Foundation
import SwiftUI

enum CustomFontKey: FontKey {
    
    case karla, banksia
    
    static func key(forTextStyle textStyle: Font.TextStyle) -> CustomFontKey {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return .banksia
        default:
            return .karla
        }
    }
    
    func weight(forTextStyle textStyle: Font.TextStyle) -> Font.Weight {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return .black
        case .headline, .subheadline:
            return .bold
        default:
            return .regular
        }
    }
    
    func name(forWeight weight: Font.Weight) -> String? {
        switch self {
        case .banksia:
            switch weight {
            case .black: return "Banksia  Black"
            default: return nil
            }
        case .karla:
            switch weight {
            case .regular: return "Karla-Regular"
            case .bold: return "Karla-Bold"
            case .heavy: return "Karla-ExtraBold"
            default: return nil
            }
        }
    }
}

extension Fonts {
    
    static let custom = Fonts(styles: CustomFontKey.styles)
}

extension Font.TextStyle: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .largeTitle: return "Large Title"
        case .title: return "Title"
        case .title2: return "Title 2"
        case .title3: return "Title 3"
        case .headline: return "Headline"
        case .body: return "Body"
        case .callout: return "Callout"
        case .subheadline: return "Subheadline"
        case .footnote: return "Footnote"
        case .caption: return "Caption"
        case .caption2: return "Caption 2"
        @unknown default: return "Unknown"
        }
    }
}
