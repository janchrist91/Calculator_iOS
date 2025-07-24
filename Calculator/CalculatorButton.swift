//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Jan Christ on 22.07.25.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText = "1"
    var color = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button(action: {
            action(self)
        }, label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: 70, height: 70, alignment: .center)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        })
    }
}

#Preview {
    CalculatorButton()
}
