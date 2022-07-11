//
//  ContentView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import Beryllium
import Combine
import Emerald
import SwiftUI

struct ContentView: View {
    
    @StateObject private var board = DemoBoard()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            BoardView(board: board) { spaces in
                HStack {
                    ForEach(spaces) {
                        DemoSpaceView(space: $0)
                    }
                }
                .padding([.vertical], .xl)
            }
            
            Form {
                Group {
                    HStack {
                        Stepper("\(board.spaces.first!.tokenCount) cards") {
                            board.spaces.first!.place(token: card())
                        } onDecrement: {
                            _ = board.spaces.first!.take(at: .zero)
                        }
                        .tint(.berilo)
                    }
                    
                    Button("Transfer") {
                        withAnimation(.easeOut) {
                            if let card = board.spaces.first!.take(at: .zero) {
                                board.spaces.last!.place(token: card)
//                                _ = board.spaces.first!.take(at: .zero)
                            }
                        }
                    }
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
