//
//  ContentView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import Emerald
import SwiftUI

struct ContentView: View {
    
    @StateObject private var demoSpace = DemoSpace()
    
    var body: some View {
        VStack {
            DemoSpaceView(space: demoSpace)
                .frame(width: 100)
            
            Button("Add Card") {
                demoSpace.place(token: DemoCard.preview)
            }
            .padding([.top], .xxl)
        }
//        HStack {
//            DemoCardView(card: .preview)
//            DemoCardView(card: .preview)
//            DemoCardView(card: .preview)
//        }
//        .padding([.horizontal], .l)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
