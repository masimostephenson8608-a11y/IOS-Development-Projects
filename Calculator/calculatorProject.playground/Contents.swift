import UIKit

enum Operation {
    case addition, subtraction, multiplication, division, clear
}

var values: [String] = [""]
var operations: [Operation] = []
var valuesIndex = 0


@MainActor func buttonPressed(_ number : Int) {
    if values.indices.contains(valuesIndex) == false {
        values.append("")
    }
    switch number {
    case 0...9:
        values[valuesIndex] += String(number)
    default:
        0
    }
}

@MainActor func decimalButton() {
    values[valuesIndex] += "."
}


@MainActor func operationPressed(_ opp: Operation) {
    if operations.count < values.count {
        if opp == .clear {                                      // CLEARING THE ARRAYS AND INDEX
            values.removeAll()
            operations.removeAll()
            valuesIndex = 0
        } else {                                    // APPENDING NEW EMPTY VALUE TO VALUES AND INCREASING INDEX
            operations.append(opp)
            valuesIndex += 1
        }
    }
}

@MainActor func equals() {
    var replacement: Double = 0
    if values.last == "" {                          // CHECKING TO SEE IF values LAST ELEMENT IS EMPTY
        values.remove(at: values.count - 1)
        valuesIndex -= 1
    }
    var operationsUsed = 0
    for (index, opp) in operations.enumerated() {
        
        switch opp {                                   // SWITCH STATEMENT FOR MULTIPLICATION AND DIVISION ONLY
        case .division:
            if let conversion1 = Double(values[index - operationsUsed]),
               let conversion2 = Double(values[index + 1 - operationsUsed]) {        // UNWRAPPING ELEMENTS FOR DIVISION
                replacement = conversion1 / conversion2
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - operationsUsed)
                values.remove(at: index - operationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - operationsUsed) {
                values.insert(String(replacement),
                              at: index - operationsUsed)
            } else {
                values.append(String(replacement))
            }
            operationsUsed += 1
        case .multiplication:                 // MULTIPLICATION CASE
            if let conversion1 = Double(values[index - operationsUsed]),
               let conversion2 = Double(values[index + 1 - operationsUsed]) {        // UNWRAPPING ELEMENTS FOR DIVISION
                replacement = conversion1 * conversion2
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - operationsUsed)
                values.remove(at: index - operationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - operationsUsed) {
                values.insert(String(replacement),
                              at: index - operationsUsed)
            } else {
                values.append(String(replacement))
            }
            operationsUsed += 1
            
                                                                        // END SWITCH-STATEMENT FOR MULT AND DIVISION
        default:
            0
        }
        switch opp {
        case .addition:
            if let conversion1 = Double(values[index - operationsUsed]),
               let conversion2 = Double(values[index + 1 - operationsUsed]) {        // UNWRAPPING ELEMENTS FOR DIVISION
                replacement = conversion1 + conversion2
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - operationsUsed)
                values.remove(at: index - operationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - operationsUsed) {
                values.insert(String(replacement),
                              at: index - operationsUsed)
            } else {
                values.append(String(replacement))
            }
            operationsUsed += 1

        case .subtraction:
            if let conversion1 = Double(values[index - operationsUsed]),
               let conversion2 = Double(values[index + 1 - operationsUsed]) {        // UNWRAPPING ELEMENTS FOR DIVISION
                replacement = conversion1 - conversion2
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - operationsUsed)
                values.remove(at: index - operationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - operationsUsed) {
                values.insert(String(replacement),
                              at: index - operationsUsed)
            } else {
                values.append(String(replacement))
            }
            operationsUsed += 1

        default:
            0
        }
    }
}


/// TESTING DIVISION
//buttonPressed(9)
//buttonPressed(8)
//decimalButton()
//operationPressed(.multiplication)
//buttonPressed(2)
//operationPressed(.addition)
//buttonPressed(5)
//buttonPressed(4)
//decimalButton()
//buttonPressed(8)
//operationPressed(.division)
//operationPressed(.division)
//buttonPressed(2)
//operationPressed(.addition)
//buttonPressed(9)
//buttonPressed(9)
//operationPressed(.division)
//buttonPressed(1)
//buttonPressed(0)
//print(values)
//equals()
//print(values)


/// TESTING MULTIPLICATION
//buttonPressed(9)
//buttonPressed(8)
//decimalButton()
//operationPressed(.addition)
//buttonPressed(5)
//buttonPressed(4)
//decimalButton()
//buttonPressed(8)
//operationPressed(.multiplication)
//operationPressed(.division)
//buttonPressed(2)
//operationPressed(.addition)
//buttonPressed(9)
//buttonPressed(9)
//operationPressed(.multiplication)
//buttonPressed(1)
//buttonPressed(0)
//print(values)
//equals()
//print(values)

/// TESTING ADDITION AND SUBTRACTION
//buttonPressed(9)
//buttonPressed(8)
//decimalButton()
//operationPressed(.addition)
//buttonPressed(5)
//buttonPressed(4)
//decimalButton()
//buttonPressed(8)
//operationPressed(.subtraction)
//operationPressed(.addition)
//buttonPressed(2)
//operationPressed(.addition)
//buttonPressed(9)
//buttonPressed(9)
//operationPressed(.subtraction)
//buttonPressed(1)
//buttonPressed(0)
//print(values)
//equals()
//print(values)

