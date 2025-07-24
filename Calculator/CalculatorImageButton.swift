//
//  CalculatorImageButton.swift
//  Calculator
//
//  Created by Jan Christ on 24.07.25.
//

import SwiftUI

struct CalculatorImageButton: View {
    var buttonText = "plus"
    var color = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var action: (CalculatorImageButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button(action: {
            action(self)
        }, label: {
            Image(systemName: buttonText)
                .font(.largeTitle)
                .frame(width: 70, height: 70, alignment: .center)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        })
    }
}

#Preview {
    CalculatorImageButton()
}
