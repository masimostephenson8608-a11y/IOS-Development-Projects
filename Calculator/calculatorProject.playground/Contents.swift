import UIKit

struct Calculator {
    enum Operation {
        case addition, subtraction, multiplication, division, clear, percentage
    }
    
    var values: [String] = [""]
    var operations: [Operation] = []
    var valuesIndex = 0
    
    
    mutating func buttonPressed(_ number : Int) {
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
    
    mutating func decimalButton() {
        values[valuesIndex] += "."
    }
    
    
    mutating func operationPressed(_ opp: Operation) {
        if opp == .clear {                                      // CLEARING THE ARRAYS AND INDEX
            values.removeAll()
            operations.removeAll()
            valuesIndex = 0
        } else if opp == .percentage {
            if values.indices.contains(valuesIndex) {
                if let number = Double(values[valuesIndex]) {
                    values[valuesIndex] = String(number / 100)
                } else { print("failed") }
            }
        } else if operations.count < values.count {
            operations.append(opp)
            valuesIndex += 1
        }
    }
    
    mutating func negative() {
        if values.indices.contains(valuesIndex) && values[valuesIndex].contains("-") {
            values[valuesIndex].removeFirst()
            return
        }
        if values.indices.contains(valuesIndex) && values[valuesIndex].contains("-") == false {
            values[valuesIndex] = "-" + values[valuesIndex]
        } else if values.indices.contains(valuesIndex) == false {
            values.append("-")
        }
    }
    
    mutating func equals() {
        var replacement: Double = 0
        if operations.count == values.count {
            operations.removeLast()
        }
        for (x, y) in values.enumerated() {
            if y.contains("-") && y.count == 1 {
                values[x].removeAll()
            }
        }
        if values.isEmpty {
            return
        }
        
        for (x, y) in values.enumerated() {         // CHECKING TO SEE IF ANY ELEMENTS ARE EMPTY
            if y == "" {
                values.remove(at: x)
                valuesIndex -= 1
            }
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
}
/// TESTING PERCENTAGE
//buttonPressed(1)
//buttonPressed(5)
//operationPressed(.percentage)
//print(values)

/// TESTING SIGN INVERT
//buttonPressed(1)
//operationPressed(.negative)
//print(values)

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
///
var calc = Calculator()
calc.buttonPressed(9)
calc.buttonPressed(8)
calc.decimalButton()
calc.operationPressed(.addition)
calc.buttonPressed(5)
calc.buttonPressed(4)
calc.decimalButton()
calc.buttonPressed(8)
calc.operationPressed(.subtraction)
calc.operationPressed(.addition)
calc.buttonPressed(2)
calc.operationPressed(.addition)
calc.buttonPressed(9)
calc.buttonPressed(9)
calc.operationPressed(.subtraction)
calc.buttonPressed(1)
calc.buttonPressed(0)
calc.equals()
print("Result =", calc.values[0])
calc.operationPressed(.clear)

///// TESTING ALL OF IT
calc.buttonPressed(1)
calc.buttonPressed(0)
calc.buttonPressed(0)
calc.operationPressed(.multiplication)
calc.buttonPressed(1)
calc.buttonPressed(0)

calc.operationPressed(.addition)

calc.buttonPressed(1)
calc.buttonPressed(0)
calc.operationPressed(.multiplication)
calc.buttonPressed(1)
calc.buttonPressed(0)

calc.operationPressed(.subtraction)

calc.buttonPressed(5)
calc.buttonPressed(0)
calc.negative()
calc.operationPressed(.percentage)
calc.operationPressed(.division)
calc.buttonPressed(2)
calc.operationPressed(.multiplication)
calc.equals()
print("Result =", calc.values[0])
