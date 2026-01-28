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
            Spacer()
            
            UIBoardView(board: board) {
                UISpaceGrid(spaces: $0, cols: 3, spacing: CGSize(length: .ms)) {
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
                board.deal(DemoCard.createRandom(), at: $0.location)
            })
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.blue.lightened(by: 0.4))
    }
    
    // MARK: - Private

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
