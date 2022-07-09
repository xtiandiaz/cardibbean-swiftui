//
//  ContentView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import Beryllium
import Emerald
import SwiftUI

struct ContentView: View {
    
    @StateObject private var space = DemoSpace()
    
    var body: some View {
        VStack {
            DemoSpaceView(space: space)
                .padding([.vertical], .xl)
            
            Form {
                HStack {
                    Stepper("\(space.tokenCount) cards") {
                        space.place(token: card())
                    } onDecrement: {
                        _ = space.take(at: .zero)
                    }
                }
                
                Toggle("Should highlight", isOn: $space.isHighlighted)
            }
        }
    }
    
    // MARK: - Private
    
    private func card() -> DemoCard {
        DemoCard.create(for: [.player, .merchant, .monster(.kraken), .pirate(.lieutenant)].randomElement()!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
