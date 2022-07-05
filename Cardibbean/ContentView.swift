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
            CardView(card: .preview)
            CardView(card: .preview)
            CardView(card: .preview)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
