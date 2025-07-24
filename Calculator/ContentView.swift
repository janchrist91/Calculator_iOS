//
//  ContentView.swift
//  Calculator
//
//  Created by Jan Christ on 22.07.25.
//

import SwiftUI

struct ContentView: View {
    @State var total = "0"
    var body: some View {
        VStack {
            TotalText (value: total)
            ButtonGrid(total: $total)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
