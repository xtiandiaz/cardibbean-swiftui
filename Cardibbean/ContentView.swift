//
//  ContentView.swift
//  Cardibbean
//
//  Created by Cristian Diaz on 5.7.2022.
//

import Emerald
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            DemoCardView(card: .preview)
            DemoCardView(card: .preview)
            DemoCardView(card: .preview)
        }
        .padding([.horizontal], .l)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
