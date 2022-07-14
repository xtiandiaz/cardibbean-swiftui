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
//    @StateObject private var handBoard = Board(spaces: [.ini(tokenAspect: CGSize(width: 1, height: 1.25))])
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            BoardView(board: board) {
                SpaceGrid(spaces: $0, cols: 3, spacing: CGSize(length: .ms)) {
                    switch $0 {
                    case let space as DemoSpace:
                        DemoSpaceView(space: space)
                    default:
                        EmptyView()
                    }
                }
                .padding(.m)
            }
            .gesture(DragGesture(minimumDistance: 0).onEnded {
                board.dropToken(DemoCard.createRandom(), at: $0.location)
            })
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.delfino)

//            BoardView(board: handBoard) { spaces in
//                HandSpaceView(space: spaces[0]) {
//                    DemoCardView(card: $0)
//                } placeholder: {
//                    Rectangle().fill(.black.withAlphaComponent(0.15))
//                } highlight: {
//                    EmptyView()
//                }
//            }
//            .gesture(DragGesture(minimumDistance: 0).onEnded {
//                handBoard.dropToken(DemoCard.createRandom(), at: $0.location)
//            })
            
//            Form {
//                Group {
//                    HStack {
//                        Stepper("\(board.spaces.first!.tokenCount) cards") {
//                            board.spaces.first!.place(token: )
//                        } onDecrement: {
//                            _ = board.spaces.first!.take(at: .zero)
//                        }
//                        .tint(.berilo)
//                    }
                    
//                    Button("Transfer") {
//                        withAnimation(.easeOut) {
//                            if let card = board.spaces.first!.take(at: .zero) {
//                                board.spaces.last!.place(token: card)
//                                _ = board.spaces.first!.take(at: .zero)
//                            }
//                        }
//                    }
//                }
//                .listRowSeparatorTint(.greenwich)
//                .listRowBackground(Color.blancox)
//            }
//            .foregroundColor(.crudo)
//            .background(Color.estuco)
//            .accentColor(.berilo)
    }
    
    // MARK: - Private

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
