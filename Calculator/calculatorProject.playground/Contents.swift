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
    if opp == .clear {                                      // CLEARING THE ARRAYS AND INDEX
        values.removeAll()
        operations.removeAll()
        valuesIndex = 0
    } else if operations.count < values.count {
        operations.append(opp)
        valuesIndex += 1
    }
}

@MainActor func equals() {
    var replacement: Double = 0
    if values.isEmpty {
        return
    }
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
                print("\(conversion1) divided by \(conversion2) = \(replacement)")
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
               let conversion2 = Double(values[index + 1 - operationsUsed]) {        // UNWRAPPING ELEMENTS FOR MULTIPLICATION
                replacement = conversion1 * conversion2
                print("\(conversion1) times \(conversion2) = \(replacement)")
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
    }
    operations.removeAll(where: { $0 == .multiplication || $0 == .division})
    
    var newOperationsUsed = 0
    
    for (index, opp) in operations.enumerated() {

        switch opp {
        case .addition:

            if let conversion1 = Double(values[index - newOperationsUsed]),
               let conversion2 = Double(values[index + 1 - newOperationsUsed]) {        // UNWRAPPING ELEMENTS FOR ADDITION
                replacement = conversion1 + conversion2
                print("\(conversion1) plus \(conversion2) = \(replacement)")
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - newOperationsUsed)
                values.remove(at: index - newOperationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - newOperationsUsed) {
                values.insert(String(replacement),
                              at: index - newOperationsUsed)


            } else {
                values.append(String(replacement))

            }
            newOperationsUsed += 1

            
            
        case .subtraction:

            if let conversion1 = Double(values[index - newOperationsUsed]),
               let conversion2 = Double(values[index + 1 - newOperationsUsed]) {        // UNWRAPPING ELEMENTS FOR SUBTRACTION
                replacement = conversion1 - conversion2
                print("\(conversion1) minus \(conversion2) = \(replacement)")
            } else { print("Failed") }
            
            if values.count > 1 {
                values.remove(at: index - newOperationsUsed)
                values.remove(at: index - newOperationsUsed)                //REMOVING ELEMENTS IN values
            } else {
                values.removeLast()
            }
            
            
            if values.indices.contains(index - newOperationsUsed) {
                values.insert(String(replacement),
                              at: index - newOperationsUsed)

            } else {
                values.append(String(replacement))

            }
            newOperationsUsed += 1

            

            
        default:
            0
        }
    }
}


/// TESTING MULTIPLICATION
//buttonPressed(5)
//buttonPressed(4)
//decimalButton()
//buttonPressed(8)
//operationPressed(.multiplication)
//operationPressed(.division)
//buttonPressed(2)
//operationPressed(.multiplication)
//buttonPressed(1)
//buttonPressed(0)
//equals()
//print("Result =", values[0])
//operationPressed(.clear)
//
///// TESTING ADDITION AND SUBTRACTION
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
//equals()
//print("Result =", values[0])
//operationPressed(.clear)
//
///// TESTING ALL OF IT
//buttonPressed(1)
//buttonPressed(0)
//buttonPressed(0)
//operationPressed(.multiplication)
//buttonPressed(1)
//buttonPressed(0)
//
//operationPressed(.addition)
//
//buttonPressed(1)
//buttonPressed(0)
//operationPressed(.multiplication)
//buttonPressed(1)
//buttonPressed(0)
//
//operationPressed(.subtraction)
//
//buttonPressed(5)
//buttonPressed(0)
//operationPressed(.division)
//buttonPressed(1)
//equals()
//print("Result =", values[0])
