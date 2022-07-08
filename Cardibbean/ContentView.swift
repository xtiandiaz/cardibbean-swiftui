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
    
    @StateObject private var demoSpace = DemoSpace()
    
    var body: some View {
        VStack {
            DemoSpaceView(space: demoSpace)
            
            HStack {
                Button("Add Card") {
                    demoSpace.place(token: DemoCard.create(
                        for: [.player, .merchant, .monster(.kraken), .pirate(.lieutenant)].randomElement()!
                    ))
                }
                Button("Remove Card") {
                    demoSpace.take(at: .zero)
                }
            }
            .padding([.top], .xxl)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
