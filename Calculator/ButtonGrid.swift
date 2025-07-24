//
//  ButtonGrid.swift
//  Calculator
//
//  Created by Jan Christ on 22.07.25.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
    case division
}

struct ButtonGrid: View {
    @Binding var total: String
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedDouble = 0.0
    @State var currentDouble = 0.0
    var body: some View {
        Grid {
            GridRow {
                CalculatorButton(buttonText: "1", action: numberWasPressed)
                CalculatorButton(buttonText: "2", action: numberWasPressed)
                CalculatorButton(buttonText: "3", action: numberWasPressed)
                CalculatorImageButton(buttonText: "plus", color: .orange, action: modeWasPressed, mode: .addition)
            }
            GridRow {
                CalculatorButton(buttonText: "4", action: numberWasPressed)
                CalculatorButton(buttonText: "5", action: numberWasPressed)
                CalculatorButton(buttonText: "6", action: numberWasPressed)
                CalculatorImageButton(buttonText: "minus", color: .orange, action: modeWasPressed, mode: .subtraction)
            }
            GridRow {
                CalculatorButton(buttonText: "7", action: numberWasPressed)
                CalculatorButton(buttonText: "8", action: numberWasPressed)
                CalculatorButton(buttonText: "9", action: numberWasPressed)
                CalculatorImageButton(buttonText: "multiply", color: .orange, action: modeWasPressed, mode: .multiplication)
            }
            GridRow {
                CalculatorButton(buttonText: "0", action: numberWasPressed)
                CalculatorButton(buttonText: "C", color: .gray, action: clearWasPressed)
                CalculatorImageButton(buttonText: "equal", color: .orange, action: equalWasPressed)
                CalculatorImageButton(buttonText: "divide", color: .orange, action: modeWasPressed, mode: .division)
            }
        }
    }
    
    func numberWasPressed(button: CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentDouble = 0
        }

        let currentText = total == "0" || lastButtonWasMode ? "" : String(format: "%g", currentDouble)
        let newText = currentText + button.buttonText

        if let newDouble = Double(newText) {
            currentDouble = newDouble
            updateText()
        } else {
            total = "Error"
            currentDouble = 0
        }
    }
    
    func modeWasPressed(button: CalculatorImageButton) {
        currentMode = button.mode
        savedDouble = currentDouble
        lastButtonWasMode = true
    }
    
    func clearWasPressed(button: CalculatorButton) {
        total = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedDouble = 0
        currentDouble = 0
    }
    
    func equalWasPressed(button: CalculatorImageButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }

        switch currentMode {
        case .addition:
            savedDouble += currentDouble
        case .subtraction:
            savedDouble -= currentDouble
        case .multiplication:
            savedDouble *= currentDouble
        case .division:
            if currentDouble == 0 {
                total = "Error"
                return
            }
            savedDouble /= currentDouble
        default:
            break
        }

        currentDouble = savedDouble
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 10
        formatter.minimumFractionDigits = 0

        total = formatter.string(for: currentDouble) ?? "Error"
    }
}

#Preview {
    ButtonGrid(total: .constant("0"))
}
