//
//  TotalText.swift
//  Calculator
//
//  Created by Jan Christ on 22.07.25.
//

import SwiftUI

struct TotalText: View {
    var value = "0"
    var body: some View {
        Text(value)
            .frame(width: 310, alignment: .bottomTrailing)
            .fontWeight(.light)
            .font(.system(size: 80))
            .padding()
            .lineLimit(1)
    }
}

#Preview {
    TotalText()
}
