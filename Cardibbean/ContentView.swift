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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            DemoSpaceView(space: space)
                .padding([.vertical], .xl)
            
            Form {
                Group {
                    HStack {
                        Stepper("\(space.tokenCount) cards") {
                            space.place(token: card())
                        } onDecrement: {
                            _ = space.take(at: .zero)
                        }
                        .tint(.berilo)
                    }
                    
                    Toggle("Should highlight", isOn: $space.isHighlighted)
                        .tint(.berilo)
                }
                .listRowSeparatorTint(.greenwich)
                .listRowBackground(Color.blancox)
            }
            .foregroundColor(.crudo)
            .background(Color.estuco)
            .accentColor(.berilo)
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
